module Api
  class SignController < Api::BaseController
    attr_reader :expires

    def initialize
      @expires = 10.hours.from_now
      @uuid = SecureRandom.uuid
      @env = Rails.env
    end

    def sign_campaign_media_plan
      @model = "cmapaign"
      @attribute = "media_plan"
      sign
    end

    def sign
      render json: {
        acl: 'private',
        awsaccesskeyid: ENV['AWS_ACCESS_KEY_ID'],
        bucket: 'r3act',
        expires: expires,
        key: key,
        policy: policy,
        signature: signature,
        success_action_status: '201',
        'Content-Type' => params[:type],
        'Cache-Control' => 'max-age=630720000, public'
      }, status: :ok
    end

    def signature
      Base64.strict_encode64(
        OpenSSL::HMAC.digest(
          OpenSSL::Digest::Digest.new('sha1'),
          ENV['AWS_SECRET_ACCESS_KEY'],
          policy({ secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'] })
        )
      )
    end

    def policy(options = {})
      Base64.strict_encode64(
        {
          expiration: @expires,
          conditions: [
            { bucket: 'r3act' },
            { acl: 'private' },
            { expires: @expires },
            { success_action_status: '201' },
            [ 'starts-with', '$key', '' ],
            [ 'starts-with', '$Content-Type', '' ],
            [ 'starts-with', '$Cache-Control', '' ],
            [ 'content-length-range', 0, 524288000 ]
          ]
        }.to_json
      )
    end

    def key
      "uploads/#{@env}/#{@model}/#{@attribute}/#{@uuid}/#{params[:name]}"
    end

  end
end