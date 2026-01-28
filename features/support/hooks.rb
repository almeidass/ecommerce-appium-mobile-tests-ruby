Before do
  @driver.start_driver unless @driver.driver
  @driver.manage.timeouts.implicit_wait = DEFAULT_TIMEOUT

  WelcomeScreen.dismiss if WelcomeScreen.visible?
end

After do
  @driver.driver_quit if @driver.driver
rescue StandardError => e
  warn "Failed to quit driver: #{e.message}"
end
