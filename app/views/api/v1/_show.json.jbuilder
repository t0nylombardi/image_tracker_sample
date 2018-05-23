campaign ||= @campaign

  json.id campaign["id"]
  json.station campaign["station"]
  json.banner_size campaign["banner_size"]
  json.ip_address campaign["ip_address"]
  json.city campaign["city"]
  json.state campaign["state"]
  json.user_agent campaign["user_agent"]
  json.referral campaign["referral"]
  json.created_at campaign["created_at"]
