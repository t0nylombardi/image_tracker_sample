module ApplicationHelper
  def block_ip_addresses
    redirect_to "http://sweeps-support.com/" if black_list.include? current_ip_address
  end

  def black_list
    # if there is ips you want to list to block. 
    []
  end

  def browser
    Browser.new(request.user_agent)
  end

  def current_ip_address
    request.env['HTTP_X_REAL_IP'] || request.env['REMOTE_ADDR']
  end

  def split_params(str)
    decode = Base64.decode64(str)
    result      = decode.split(/&/)
    banner_size = result[0].gsub('banner_size=', '')
    campaign   = result[1].gsub('campaign=', '')
    station    = result[2].gsub('station=', '')
    [banner_size,campaign,station]
  end
end
