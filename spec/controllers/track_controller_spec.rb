require 'rails_helper'

RSpec.describe TrackController, type: :controller do

  describe "GET #click_through" do
    it "returns redirects to sweeps-support" do
      get :click_through
      expect(response).to redirect_to "http://sweeps-support.com"
    end
  end

  describe "GET #click_through" do
    it "returns redirects to sweeps-support on error" do
      get :click_through, track: ''
      expect(response).to redirect_to "http://sweeps-support.com"
    end
  end


  describe "GET #click_through" do
    it "returns redirects to Australian Gold" do
      get :click_through, track: 'Y2FtcGFpZ249YWdfNDIwMjAxNiZiYW5uZXJfc2l6ZT03MjhYOTAmc3RhdGlvbj1XUVJUWSZyZWRpcmVjdD1odHRwOi8vd3d3LmF1c3RyYWxpYW5nb2xkLmNvbS8yMDE2LW9mZmVycy5odG1s'
      expect(response).to redirect_to "http://www.australiangold.com/2016-offers.html"
    end
  end


  # describe "GET #click_through" do
  #   it "returns redirects to sweeps-support on bad encoded url" do
  #     get :click_through, track: 'Y2FtcGFpZ249YWdfNDIwMjAx'
  #     expect(response).to redirect_to "http://sweeps-support.com"
  #   end
  # end

end
