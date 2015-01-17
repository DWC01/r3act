require 'dfp_api'  
require 'base64'

class Dfp
  attr_reader :api_version, :dfp, :campaign_id,
              :advertiser_id, :network_id, :ad_tags

  def initialize( campaign_id, network_id, advertiser_id )
    @api_version    = :v201408
    @campaign_id    = campaign_id
    @advertiser_id  = advertiser_id 
    @network_id     = network_id

    @ad_tags        = set_ad_tags
    @dfp            = set_dfp
  end

  def set_dfp
    DfpApi::Api.new({
      authentication: {
        method: 'OAUTH2_JWT',
        oauth2_issuer: ENV['OAUTH2_ISSUER'],
        oauth2_secret: ENV['OAUTH2_SECRET'],
        oauth2_keyfile: ENV['OAUTH2_KEYFILE'],
        application_name: 'coherent-span-715',
        network_code: network_id
      },
      service: {
        environment: 'PRODUCTION'
      },
      connection: {
        enable_gzip: false
      }
    })
  end
  
  def set_ad_tags
    AdTag.where(campaign_id: campaign_id)
  end

  def authorize_dfp
    @dfp.authorize({:oauth2_keyfile => ENV['OAUTH2_KEYFILE']})
  end
 
  def set_creative_service
    @dfp.service(:CreativeService, api_version)
  end

  def traffic_ad_tags
    authorize_dfp
    creative_service = set_creative_service

    # Create an array to store local creative objects.
    creatives = @ad_tags.map do |ad_tag|
      {
        :xsi_type => 'ThirdPartyCreative',
        :name => ad_tag.placement_name % [ad_tag, (Time.new.to_f * 1000).to_i],
        :advertiser_id => advertiser_id.to_i,
        :snippet => "ad_tag.javascript_tag",
        :size => {:width => 300, :height => 250}
      }
    end

    # Create the creatives on the server.
    return_creatives = creative_service.create_creatives(creatives)

    # HTTP errors.
    rescue AdsCommon::Errors::HttpError => e
      puts "HTTP Error: %s" % e

    # API errors.
    rescue DfpApi::Errors::ApiException => e
      puts "Message: %s" % e.message
      puts 'Errors:'
      e.errors.each_with_index do |error, index|
        puts "\tError [%d]:" % (index + 1)
        error.each do |field, value|
          puts "\t\t%s: %s" % [field, value]
        end
      end
  end

end