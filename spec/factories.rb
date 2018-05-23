# This will guess the User class
FactoryGirl.define do
  factory :click_events do
    ip_address "24.190.123.140"
    campaign "test"
    banner_size "1024x1024"
    station "QWERTY"
    city "White Plains"
    state "NY"
    user_agent "Test Chrome"
    referral "/roots"
  end

end
