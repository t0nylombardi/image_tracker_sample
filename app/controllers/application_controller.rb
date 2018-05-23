class ApplicationController < ActionController::Base
  include ApplicationHelper
  #before_filter :block_ip_addresses, :except => [:click_through]

  protect_from_forgery with: :exception

  # Captures info from 404 errors and submits the info into the table
  # Crawlers. Alternatively, if the info cannot be entered into the database,
  # the controller will make a note of the crawler in the log file.
  #
  def page_not_found
    params = {
      ip_address: request.ip,
      access_path: request.path,
      browser_type: browser.to_s,
      is_it_a_bot: browser.bot?.to_bool
    }
    if Crawler.create!(params)
      logger.info "awesome!"
    else
      logger.warn("\n\nCrawler on #{Date.today}:"\
                  "\n\tIp Address: #{request.ip}"\
                  "\n\Access Path: #{request.path}"\
                  "\n\tBrowser Type: #{browser.to_s}"\
                  "\n\tIs it a bot? #{browser.bot?}\n\n\n")
    end
    redirect_to "http://sweeps-support.com"
  end

end
