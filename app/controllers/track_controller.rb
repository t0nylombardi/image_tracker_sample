class TrackController < ApplicationController
  before_action :encoded_url
  before_action :set_decoded
  before_action :set_location

  # Takes one Param *track*
  def click_through
    if ClickEvent.create!(hash_params)
      logger.info "Databse Entry created"
    else
      logger.error "\n\nError on #{Date.today}:"\
                    "\n\tIp Address: #{request.ip}"\
                    "\n\Access Path: #{request.path}"\
                    "\n\tBrowser Type: #{request.user_agent}"
    end
    redirect_to @decoded[:redirect]
  end

  private

  def set_decoded
    @decoded = Services::Params.deploy @encoded_url
  end

  def set_location
    @location = Services::Locations.lookup request.ip
  end

  def encoded_url
    if params[:track].nil? || params[:track].empty?
      page_not_found
    else
      if params[:track].length > 40
        return @encoded_url = params[:track]
      else
        return @encoded_url = params
      end
    end
  end

  def hash_params
    {
      ip_address:     @location["ipAddress"],
      campaign:       @decoded[:campaign],
      banner_size:    @decoded[:banner_size],
      station:        @decoded[:station],
      city:           @location["cityName"],
      state:          @location["regionName"],
      user_agent:     request.user_agent,
      referral:       request.referer
    }
  end

end
