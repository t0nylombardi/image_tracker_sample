class Api::V1::ApiClientsController < Api::V1::BaseApiController
  include ActionController::Live

  before_filter :find_client_campaign, only: [:show, :index]



  def index
    # get all 
  end

  def get_6_hours
    six_hours = find_by_time 6.hours.ago
    render json: six_hours
  end

  def get_24_hours
    twentyfour_hours = find_by_time 24.hours.ago
    render json:  twentyfour_hours
  end

  def get_7_days
    seven_days = find_by_time 7.days.ago
    render json: seven_days
  end

  def get_30_days
    thirty_days = find_by_time 30.days.ago
    render json: thirty_days
  end

  def get_all
    render json: find_client_campaign
  end

private
  def find_client_campaign
    @campaign = Pixel.where(campaign: params[:campaign])
  end

  def find_by_time(from)
    Pixel.where( campaign: params[:campaign],
                              created_at: from..Time.now)
  end
end
