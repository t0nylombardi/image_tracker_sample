class Pixel < ActiveRecord::Base
  validates_presence_of :ip_address
end
