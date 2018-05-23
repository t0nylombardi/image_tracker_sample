# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'
count = 1
CSV.foreach("#{Rails.root}/db/pixels.csv", :headers => true) do |row|
  Pixel.create!(row.to_hash)
  puts count += 1
end
