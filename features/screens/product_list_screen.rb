class ProductListScreen
  class << self
    PRODUCT_CARD_CLASS = 'android.widget.ImageView'.freeze

    def product_cards
      find_elements(:class, PRODUCT_CARD_CLASS)
    end

    def has_products?
      product_cards.any?
    end

    def loaded?
      has_products?
    end

    def wait_until_loaded(timeout = DEFAULT_TIMEOUT)
      wait(timeout) { loaded? }
    end
  end
end
