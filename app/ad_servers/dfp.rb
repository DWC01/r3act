class Dfp
  attr_reader :api_version, :dfp, :campaign_id,
              :advertiser_id, :network_id, :ad_tags,
              :creative_service, :creatives

  def initialize( campaign_id, network_id, advertiser_id, ad_tags )
    @api_version    = :v201408

    @campaign_id    = campaign_id.to_i
    @advertiser_id  = advertiser_id.to_i
    @network_id     = network_id.to_i

    @dfp              = set_dfp
    @ad_tags          = ad_tags
    @creative_service = set_creative_service
    @creatives        = set_creatives
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
  
  def set_creative_service
    @dfp.service(:CreativeService, api_version)
    @dfp.authorize({:oauth2_keyfile => ENV['OAUTH2_KEYFILE']})
  end

  def placement_name(ad_tag)
    "#{ad_tag.media_partner}_#{ad_tag.device}_#{ad_tag.placement_name}_#{ad_tag.period}_#{ad_tag.ad_type}"
  end

  def set_creatives
    ad_tags.map do |ad_tag|
      {
        :xsi_type => 'ThirdPartyCreative',
        :name => placement_name(ad_tag),
        :advertiser_id => advertiser_id,
        :snippet => mock_ad_tag,
        :size => {:width => 300, :height => 250}
      }
    end
  end

  def traffic_ad_tags
    saved_creatives = creative_service.create_creatives(creatives)
    errors = display_errors
    return saved_creatives if errors[:http].blank? && errors[:api].blank?
    errors
  end

  def display_errors
    errors = {}
    # HTTP errors.
    rescue AdsCommon::Errors::HttpError => e
      errors[:http] = e
      puts "HTTP Error: %s" % e

    # API errors.
    rescue DfpApi::Errors::ApiException => e
      errors[:api] = e
      puts "Message: %s" % e.message
      puts 'Errors:'
      e.errors.each_with_index do |error, index|
        puts "\tError [%d]:" % (index + 1)
        error.each do |field, value|
          puts "\t\t%s: %s" % [field, value]
        end
      end
    errors
  end

  def mock_saved_creatives
    [
      {:advertiser_id=>493276581, :id=>59705891421, :name=>"iNC_Desktop_Catalogue_FY14/15Cost Per Read ", :size=>{:width=>300, :height=>250, :is_aspect_ratio=>false}, :preview_url=>"http://partner.googleadservices.com/gampad/ads?gct=tr5Klgz34xwKWPgMAfoWUggJEBYgAEoAWICAgKDjh_3ldrgB3bT-td4B0gIJdGV4dC9odG1s8AKsAvgC-gGQAwHIA6wC0AP6AfADAsoFDi9wYWdlYWQvaW1nLy4u-gYCKAAYjpLtpQUoADCOrqKtBTgAWAFqBl9ibGFua3CNku2lBQ&iu=33988861&gdfp_req=1&height=250&width=300&impl=ifr", :last_modified_date_time=>{:date=>{:year=>2015, :month=>1, :day=>17}, :hour=>21, :minute=>47, :second=>58, :time_zone_id=>"PST8PDT"}, :creative_type=>"ThirdPartyCreative", :snippet=>"ad_tag.javascript_tag", :expanded_snippet=>"ad_tag.javascript_tag", :locked_orientation=>"FREE_ORIENTATION", :xsi_type=>"ThirdPartyCreative"},
      {:advertiser_id=>493276581, :id=>59705891541, :name=>"Google_Desktop_Catalogue_FY14/15Cost Per Engagement", :size=>{:width=>300, :height=>250, :is_aspect_ratio=>false}, :preview_url=>"http://partner.googleadservices.com/gampad/ads?gct=9cU5gw6TGYIKWPgMAfoWUggJEBYgAEoAWICAgKDjh_2VWbgB1bX-td4B0gIJdGV4dC9odG1s8AKsAvgC-gGQAwHIA6wC0AP6AfADAsoFDi9wYWdlYWQvaW1nLy4u-gYCKAAYjpLtpQUoADCOrqKtBTgAWAFqBl9ibGFua3CNku2lBQ&iu=33988861&gdfp_req=1&height=250&width=300&impl=ifr", :last_modified_date_time=>{:date=>{:year=>2015, :month=>1, :day=>17}, :hour=>21, :minute=>47, :second=>58, :time_zone_id=>"PST8PDT"}, :creative_type=>"ThirdPartyCreative", :snippet=>"ad_tag.javascript_tag", :expanded_snippet=>"ad_tag.javascript_tag", :locked_orientation=>"FREE_ORIENTATION", :xsi_type=>"ThirdPartyCreative"},
      {:advertiser_id=>493276581, :id=>59705891661, :name=>"Google_Desktop_News.com.au_FY14/15MREC OTP + Skins", :size=>{:width=>300, :height=>250, :is_aspect_ratio=>false}, :preview_url=>"http://partner.googleadservices.com/gampad/ads?gct=baTkYn72UGgKWPgMAfoWUggJEBYgAEoAWICAgKDjh_2Vf7gBzbb-td4B0gIJdGV4dC9odG1s8AKsAvgC-gGQAwHIA6wC0AP6AfADAsoFDi9wYWdlYWQvaW1nLy4u-gYCKAAYjpLtpQUoADCOrqKtBTgAWAFqBl9ibGFua3CNku2lBQ&iu=33988861&gdfp_req=1&height=250&width=300&impl=ifr", :last_modified_date_time=>{:date=>{:year=>2015, :month=>1, :day=>17}, :hour=>21, :minute=>47, :second=>58, :time_zone_id=>"PST8PDT"}, :creative_type=>"ThirdPartyCreative", :snippet=>"ad_tag.javascript_tag", :expanded_snippet=>"ad_tag.javascript_tag", :locked_orientation=>"FREE_ORIENTATION", :xsi_type=>"ThirdPartyCreative"},
      {:advertiser_id=>493276581, :id=>59705891781, :name=>"Google_Desktop_Adelaide Now_FY14/15MREC OTP + Skins", :size=>{:width=>300, :height=>250, :is_aspect_ratio=>false}, :preview_url=>"http://partner.googleadservices.com/gampad/ads?gct=dovY8rx4Jh8KWfgMAfoWUwgJEBYgAEoAWICAgKDjh_3ttgG4AcW3_rXeAdICCXRleHQvaHRtbPACrAL4AvoBkAMByAOsAtAD-gHwAwLKBQ4vcGFnZWFkL2ltZy8uLvoGAigAGI6S7aUFKAAwjq6irQU4AFgBagZfYmxhbmtwjZLtpQU&iu=33988861&gdfp_req=1&height=250&width=300&impl=ifr", :last_modified_date_time=>{:date=>{:year=>2015, :month=>1, :day=>17}, :hour=>21, :minute=>47, :second=>58, :time_zone_id=>"PST8PDT"}, :creative_type=>"ThirdPartyCreative", :snippet=>"ad_tag.javascript_tag", :expanded_snippet=>"ad_tag.javascript_tag", :locked_orientation=>"FREE_ORIENTATION", :xsi_type=>"ThirdPartyCreative"},
      {:advertiser_id=>493276581, :id=>59705891901, :name=>"Google_Desktop_Perth Now_FY14/15_MREC OTP + Skins", :size=>{:width=>300, :height=>250, :is_aspect_ratio=>false}, :preview_url=>"http://partner.googleadservices.com/gampad/ads?gct=mzz8HbSGMHoKWPgMAfoWUggJEBYgAEoAWICAgKDjh_31UrgBvbj-td4B0gIJdGV4dC9odG1s8AKsAvgC-gGQAwHIA6wC0AP6AfADAsoFDi9wYWdlYWQvaW1nLy4u-gYCKAAYjpLtpQUoADCOrqKtBTgAWAFqBl9ibGFua3CNku2lBQ&iu=33988861&gdfp_req=1&height=250&width=300&impl=ifr", :last_modified_date_time=>{:date=>{:year=>2015, :month=>1, :day=>17}, :hour=>21, :minute=>47, :second=>58, :time_zone_id=>"PST8PDT"}, :creative_type=>"ThirdPartyCreative", :snippet=>"ad_tag.javascript_tag", :expanded_snippet=>"ad_tag.javascript_tag", :locked_orientation=>"FREE_ORIENTATION", :xsi_type=>"ThirdPartyCreative"},
      {:advertiser_id=>493276581, :id=>59705892021, :name=>"Exponential_Desktop_Audience Targeting - Ray's Outdoors Custom Audience_FY14/15_Pushdown Banner", :size=>{:width=>300, :height=>250, :is_aspect_ratio=>false}, :preview_url=>"http://partner.googleadservices.com/gampad/ads?gct=tgEro4Uo52UKWPgMAfoWUggJEBYgAEoAWICAgKDjh_2tX7gBtbn-td4B0gIJdGV4dC9odG1s8AKsAvgC-gGQAwHIA6wC0AP6AfADAsoFDi9wYWdlYWQvaW1nLy4u-gYCKAAYjpLtpQUoADCOrqKtBTgAWAFqBl9ibGFua3CNku2lBQ&iu=33988861&gdfp_req=1&height=250&width=300&impl=ifr", :last_modified_date_time=>{:date=>{:year=>2015, :month=>1, :day=>17}, :hour=>21, :minute=>47, :second=>58, :time_zone_id=>"PST8PDT"}, :creative_type=>"ThirdPartyCreative", :snippet=>"ad_tag.javascript_tag", :expanded_snippet=>"ad_tag.javascript_tag", :locked_orientation=>"FREE_ORIENTATION", :xsi_type=>"ThirdPartyCreative"},
      {:advertiser_id=>493276581, :id=>59705892141, :name=>"Exponential_Desktop_Audience Targeting - Ray's Outdoors Custom Audience_FY14/15_Video and Ad Bar", :size=>{:width=>300, :height=>250, :is_aspect_ratio=>false}, :preview_url=>"http://partner.googleadservices.com/gampad/ads?gct=EJastzjKxYgKWfgMAfoWUwgJEBYgAEoAWICAgKDjh_2lnQG4Aa26_rXeAdICCXRleHQvaHRtbPACrAL4AvoBkAMByAOsAtAD-gHwAwLKBQ4vcGFnZWFkL2ltZy8uLvoGAigAGI6S7aUFKAAwjq6irQU4AFgBagZfYmxhbmtwjZLtpQU&iu=33988861&gdfp_req=1&height=250&width=300&impl=ifr", :last_modified_date_time=>{:date=>{:year=>2015, :month=>1, :day=>17}, :hour=>21, :minute=>47, :second=>58, :time_zone_id=>"PST8PDT"}, :creative_type=>"ThirdPartyCreative", :snippet=>"ad_tag.javascript_tag", :expanded_snippet=>"ad_tag.javascript_tag", :locked_orientation=>"FREE_ORIENTATION", :xsi_type=>"ThirdPartyCreative"},
      {:advertiser_id=>493276581, :id=>59705892261, :name=>"Yahoo!7_All_Devices_Native CPC ads_FY14/15_Text and image", :size=>{:width=>300, :height=>250, :is_aspect_ratio=>false}, :preview_url=>"http://partner.googleadservices.com/gampad/ads?gct=NEdYvgzshdwKWPgMAfoWUggJEBYgAEoAWICAgKDjh_3lO7gBpbv-td4B0gIJdGV4dC9odG1s8AKsAvgC-gGQAwHIA6wC0AP6AfADAsoFDi9wYWdlYWQvaW1nLy4u-gYCKAAYjpLtpQUoADCOrqKtBTgAWAFqBl9ibGFua3CNku2lBQ&iu=33988861&gdfp_req=1&height=250&width=300&impl=ifr", :last_modified_date_time=>{:date=>{:year=>2015, :month=>1, :day=>17}, :hour=>21, :minute=>47, :second=>58, :time_zone_id=>"PST8PDT"}, :creative_type=>"ThirdPartyCreative", :snippet=>"ad_tag.javascript_tag", :expanded_snippet=>"ad_tag.javascript_tag", :locked_orientation=>"FREE_ORIENTATION", :xsi_type=>"ThirdPartyCreative"},
      {:advertiser_id=>493276581, :id=>59705892381, :name=>"AdRoll_All_Devices_Dynamic Retargeting_FY14/15_Liquid Ads", :size=>{:width=>300, :height=>250, :is_aspect_ratio=>false}, :preview_url=>"http://partner.googleadservices.com/gampad/ads?gct=CJ4PQ8ZxbG4KWPgMAfoWUggJEBYgAEoAWICAgKDjh_2VQrgBnbz-td4B0gIJdGV4dC9odG1s8AKsAvgC-gGQAwHIA6wC0AP6AfADAsoFDi9wYWdlYWQvaW1nLy4u-gYCKAAYjpLtpQUoADCOrqKtBTgAWAFqBl9ibGFua3CNku2lBQ&iu=33988861&gdfp_req=1&height=250&width=300&impl=ifr", :last_modified_date_time=>{:date=>{:year=>2015, :month=>1, :day=>17}, :hour=>21, :minute=>47, :second=>58, :time_zone_id=>"PST8PDT"}, :creative_type=>"ThirdPartyCreative", :snippet=>"ad_tag.javascript_tag", :expanded_snippet=>"ad_tag.javascript_tag", :locked_orientation=>"FREE_ORIENTATION", :xsi_type=>"ThirdPartyCreative"},
      {:advertiser_id=>493276581, :id=>59705892501, :name=>"Voban_All_Devicese_DM - Targeting Ray's Outdoors interested in the outdoors - CPC_FY14/15_test", :size=>{:width=>300, :height=>250, :is_aspect_ratio=>false}, :preview_url=>"http://partner.googleadservices.com/gampad/ads?gct=ZruP_7ihMO0KWPgMAfoWUggJEBYgAEoAWICAgKDjh_2dabgBlb3-td4B0gIJdGV4dC9odG1s8AKsAvgC-gGQAwHIA6wC0AP6AfADAsoFDi9wYWdlYWQvaW1nLy4u-gYCKAAYjpLtpQUoADCOrqKtBTgAWAFqBl9ibGFua3CNku2lBQ&iu=33988861&gdfp_req=1&height=250&width=300&impl=ifr", :last_modified_date_time=>{:date=>{:year=>2015, :month=>1, :day=>17}, :hour=>21, :minute=>47, :second=>58, :time_zone_id=>"PST8PDT"}, :creative_type=>"ThirdPartyCreative", :snippet=>"ad_tag.javascript_tag", :expanded_snippet=>"ad_tag.javascript_tag", :locked_orientation=>"FREE_ORIENTATION", :xsi_type=>"ThirdPartyCreative"}
    ]
  end

  def mock_ad_tag
    '<script type="text/javascript">
      var spongecellParams = {
      clickTag: "SPONGECELL_CLICK_TAG",
      clickTag1: "SPONGECELL_CLICK_TAG",
      clickTag2: "SPONGECELL_CLICK_TAG",
      clickTag3: "SPONGECELL_CLICK_TAG",
      siteId: "SPONGECELL_SITE_ID",
      placementId: "SPONGECELL_PLACEMENT_ID"
      };
      document.write(\'<sc\'+\'ript type="text/javascript" src="http://royale.cdn.spongecell.com/api/ad_tags/51218225.js?anticache=\'+Math.floor(Math.random()*10e12) + \'"></scr\'+\'ipt>\');
    </script>
    <noscript>
    <a href="http://royale.spongecell.com/api/ad_tags/51218225/clickthrough?creative_id=292643&noflash=true&noscript=true&external_placement_id=SPONGECELL_PLACEMENT_ID&external_site_id=SPONGECELL_SITE_ID&anticache=SPONGECELL_CACHE_BUSTER&click_tag=SPONGECELL_CLICK_TAG" target="_blank"><img alt="" border="0" height="600" src="http://live.cdn.spongecell.com/davis/certification/2013/q4/standardsponge/v4.29.0/assets/160x600.jpg" width="160" /></a>
      <div style="position:absolute;left:0px;top:0px;visibility:hidden;">
        <img alt="" height="0" src="http://analytics.spongecell.com/ad_tags/51218225?ad_version=PLATFORM&type=IMPRESSION&flight_id=16631&screen=DEFAULT&noflash=true&noscript=true&creative_id=292643&external_placement_id=SPONGECELL_PLACEMENT_ID&external_site_id=SPONGECELL_SITE_ID&anticache=SPONGECELL_CACHE_BUSTER&e=mc2" style="width:0px;height:0px;" width="0" />
      </div>
    </noscript>'
  end
end