require "test_helper"

Capybara.server_host = Socket.ip_address_list.detect{ |addr| addr.ipv4_private? }.ip_address
Capybara.server_port = 3002

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, options: {
    browser: :remote,
    url: ENV.fetch('SELENIUM_REMOTE_URL'),
    desired_capabilities: :chrome
  }
  host! "http://#{Capybara.server_host}:#{Capybara.server_port}"
  WebMock.allow_net_connect!
end
