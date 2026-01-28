class HomeScreen
  class << self
    LOGO_XPATH = '//android.view.View[@content-desc="CodeZen"]'.freeze
    SEARCH_FIELD_XPATH = '//android.widget.EditText[contains(@hint,"Search for")]'.freeze

    def logo
      find_element(:xpath, LOGO_XPATH)
    end

    def search_field
      find_element(:xpath, SEARCH_FIELD_XPATH)
    end

    def loaded?
      logo.displayed? && search_field.displayed?
    rescue Selenium::WebDriver::Error::NoSuchElementError
      false
    end

    def wait_until_loaded(timeout = DEFAULT_TIMEOUT)
      wait(timeout) { loaded? }
    end

    def ensure_ready
      wait_until_loaded
    end

    def open_category(category_name, timeout = DEFAULT_TIMEOUT)
      ensure_ready

      wait(timeout) do
        find_element(:xpath, "//*[contains(@content-desc,'#{category_name}')]").click
        true
      end
    end
  end
end
