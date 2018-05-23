Rails.application.routes.draw do
  get 'track/click_through'
  get "track/click_through/:track", to: 'track#click_through'
  get '/', to: 'track#click_through'
  root 'track#click_through'

  #API
  scope '/api' do
    scope '/v1' do
      scope '/clients' do
        scope '/:campaign' do
          get '/' => 'api/v1/api_clients#index',  defaults: {format: :json}
          get '/6h' => 'api/v1/api_clients#get_6_hours',  defaults: {format: :json}
          get '/24h' => 'api/v1/api_clients#get_24_hours',  defaults: {format: :json}
          get '/7d' => 'api/v1/api_clients#get_7_days',  defaults: {format: :json}
          get '/30d' => 'api/v1/api_clients#get_30_days',  defaults: {format: :json}
          get '/total' => 'api/v1/api_clients#get_all',  defaults: {format: :json}
          # Fuck it, we'll do it live.
          get '/live' => 'api/v1/api_clients#fiwdil',  defaults: {format: :json}
        end
      end
    end
  end

  #Last route in routes.rb
  get '*a', :to => 'application#page_not_found'
end
