require 'capybara'

module Capybara::RestoreState
  # Yield to the block, restoring the capybara session state after block execution.
  def restore_state
    browser = page.driver.browser
    mock_session = browser.instance_variable_get(:@_rack_test_current_session) || browser.instance_variable_get(:@_rack_mock_sessions)[:default]
    last_response = mock_session.last_response
    last_request = mock_session.last_request
    yield
  ensure
    mock_session.instance_variable_set(:@last_response, last_response)
    mock_session.instance_variable_set(:@last_request, last_request)
    page.driver.browser.reset_cache!
  end
end
