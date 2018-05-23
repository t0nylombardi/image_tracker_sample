namespace :url do
  desc "create encoded url for pixel"
  task :encode_pixel, [ :campaign,
                        :banner_size, :station] => :environment do |task, args|
    query_str = "campaign=#{args[:campaign]}&banner_size=#{args[:banner_size]}&station=#{args[:station]}"
    url = "http://104.236.243.87/assets/tracker.gif?#{Base64.encode64(query_str)}"
    puts "\nYour encoded url:\n #{url}\n\n"
    puts "\nEncoded Params: #{Base64.encode64(query_str)}\n"
  end

  desc "decode url for pixel"
  task :decode_pixel, [:string] => :environment do |task, args|
    decode = Base64.decode64(args[:string])
    result      = decode.split(/&/)
    campaign   = result[0].gsub('campaign=', '')
    station    = result[1].gsub('station=', '')
    puts "Campaign: #{campaign}\tStation:#{station}"
  end


  desc "create encoded url for click through"
  task :encode_clickthrough, [:campaign,
                              :banner_size,
                              :station,
                              :redirect] => :environment do |task, args|
    query_str = "campaign=#{args[:campaign]}&" \
                "banner_size=#{args[:banner_size]}&" \
                "station=#{args[:station]}&"\
                "redirect=#{args[:redirect]}"
    url = "http://localhost:3000?#{Base64.urlsafe_encode64(query_str)}"
    puts "\nYour encoded url:\n #{url}\n\n"
  end

  desc "decode url for click through"
  task :decode_clickthrough, [:string] => :environment do |task, args|

    decode = Base64.urlsafe_decode64(args[:string])
    result      = decode.split(/&/)
    campaign    = result[0].gsub('campaign=', '')
    banner_size = result[1].gsub('banner_size=', '')
    station     = result[2].gsub('station=', '')
    redirect    = result[3].gsub('redirect=', '')

    puts "\n\nClick through: #{campaign}\n" \
          "Banner Size:#{banner_size}\n" \
          "Station:#{station}\n" \
          "Redirect:#{redirect}\n"
  end
end
