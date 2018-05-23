module Tracker
  class Rack
    require 'benchmark'

    def initialize(app)
      @app = app
    end

    def call(env)
      @req = ::Rack::Request.new(env)
      if @req.path_info =~ /tracker.gif/
        result = Services::Params.deploy @req.query_string
        location = Services::Locations.lookup(@req.ip)
        ip_address = location["ip"] || @req.ip
        params = {
          ip_address:     ip_address,
          campaign:       result[:campaign],
          banner_size:    result[:banner_size],
          station:        result[:station],
          city:           location["city"],
          state:          location["region_name"],
          user_agent:     @req.user_agent,
          referral:       @req.referer
        }

        if @pixels = Pixel.create!(params)
          $redis.publish('pixels.create', @pixels.to_json)
          [
            200, { 'Content-Type' => 'image/gif' },
            [File.read(File.join(File.dirname(__FILE__), 'tracker.gif'))]
          ]
        else
          Rails.logger.warn "\n\n Failed to create record on:#{Date.today}"
        end
      else
        @app.call(env)
      end
    end

    def split_params(str)
      str = Base64.urlsafe_decode64(str)
      Rails.logger.warn "Decoded: \n\n\n#{str}\n\n\n"
      arry  = str.split(/&/)
      hash = {}
      arry.each do |a|
        hash[a.scan(/^\w*/).join('').to_sym] = a.gsub(/^(\w*=)/,'')
      end
      hash
    end

  end
end
