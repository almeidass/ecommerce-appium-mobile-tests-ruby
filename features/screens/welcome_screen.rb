class WelcomeScreen
  class << self
    MODAL_XPATH = <<~XPATH.freeze
      //android.view.View[contains(@content-desc,"Welcome to the Demo Experience")]
    XPATH

    CONTINUE_BUTTON_XPATH = <<~XPATH.freeze
      //android.widget.Button[@content-desc="Continue to Demo"]
    XPATH

    def modal
      find_element(:xpath, MODAL_XPATH)
    end

    def continue_button
      find_element(:xpath, CONTINUE_BUTTON_XPATH)
    end

    def visible?
      modal.displayed?
    rescue Selenium::WebDriver::Error::NoSuchElementError
      false
    end

    def not_visible?
      !visible?
    end

    def wait_until_visible(timeout = DEFAULT_TIMEOUT)
      wait(timeout) { visible? }
    end

    def wait_until_not_visible(timeout = DEFAULT_TIMEOUT)
      wait(timeout) { not_visible? }
    end

    def dismiss(timeout = DEFAULT_TIMEOUT)
      wait(timeout) do
        continue_button.click
        true
      end
    end
  end
end
