IPINFODB_API_KEY = "d7f915f12a9704152a5aea7c188a45d9074ccf49b2d94ed237e219947bf8d201"

desc "get all rows with no city or state"
task geo_locate: :environment do
  records = get_all_empty_rows
  puts "updating #{records.count} records"
  records.each do |r|
    location = lookup(r.ip_address)
    r.update!({ city: location["cityName"], state: location["regionName"] })
    puts "updated \t#{r.uniq_id}\t#{r.ip_address}\t#{r.city}\t#{r.state}"
    sleep 0.5
  end
end


def lookup(ip)
  url = "http://api.ipinfodb.com/v3/ip-city/?key=#{IPINFODB_API_KEY}&ip=#{ip}&format=json"
  response = HTTParty.get(url)
end



def get_all_empty_rows
  TmpgImpression.where("city = '' OR state = '' OR city IS NULL OR state IS NULL")
end
