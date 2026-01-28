require 'appium_lib'
require 'rspec/expectations'

DEFAULT_TIMEOUT = ENV.fetch('DEFAULT_TIMEOUT', 5).to_i

APPIUM_CAPS = {
  platformName: 'Android',
  automationName: 'UiAutomator2',
  deviceName: 'Android Emulator',
  appPackage: 'com.codezen.ecommerce.demo',
  appWaitActivity: '*',
  autoGrantPermissions: true
}.freeze

APPIUM_LIB_OPTS = {
  server_url: 'http://localhost:4723'
}.freeze

@driver = Appium::Driver.new(
  {
    caps: APPIUM_CAPS,
    appium_lib: APPIUM_LIB_OPTS
  },
  true
)

Appium.promote_appium_methods Object
