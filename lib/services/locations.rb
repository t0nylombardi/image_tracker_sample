module Services
  class Locations
    require 'net/http'

    def self.lookup(ip)
      ip_address = ip
      unless Rails.env.production?
        ip_address = random_ip_address
      end
      url = "http://freegeoip.net/json/#{ip_address}"
      begin
        HTTParty.get(url, timeout: 2)
      rescue Timeout::Error
        Rails.logger.warn("Could not post to #{url}: timeout")
        {city: nil, region_name: nil}
      rescue
        Rails.logger.warn("Could not post to #{url}")
        {city: nil, region_name: nil}
      end
    end

    def self.check_for_local(ip)
      if ["127.0.0.1", "::1"].include? ip
        "127.0.0.1"
      else
        ip
      end
    end

    def self.random_ip_address
      %w{ 46.19.209.10
          108.41.23.150
          108.41.23.150
          108.41.23.150
          46.19.209.14
          46.19.209.80 }.sample
    end

  end
end
