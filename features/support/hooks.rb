require 'fileutils'
require 'time'

Before do
  $driver.start_driver unless $driver.driver
  $driver.manage.timeouts.implicit_wait = DEFAULT_TIMEOUT

  WelcomeScreen.dismiss if WelcomeScreen.visible?
end

After do |scenario|
  begin
    timestamp = Time.now.strftime('%Y-%m-%d_%H-%M-%S')
    safe_name = scenario.name.gsub(/[^0-9A-Za-z_\-]/, '_')

    screenshots_dir = File.expand_path('../../../reports/screenshots', __FILE__)
    FileUtils.mkdir_p(screenshots_dir)

    screenshot_path = File.join(
      screenshots_dir,
      "#{timestamp}_#{safe_name}.png"
    )

    # salva o screenshot
    $driver.screenshot(screenshot_path)

    # anexa no relatório HTML
    attach(
      File.open(screenshot_path),
      'image/png',
      "Screenshot - #{scenario.name}"
    )
  rescue StandardError => e
    warn "Failed to capture screenshot: #{e.message}"
  end

  begin
    $driver.driver_quit if $driver.driver
  rescue StandardError => e
    warn "Failed to quit driver: #{e.message}"
  end
end
