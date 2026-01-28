@critical
Feature: Cart

  Scenario: Add product to cart
    Given the user is on the product list screen
    When the user opens the first product
    And the user adds the product to the cart
    Then the cart should contain 1 item

  @regression
  Scenario: Increase product quantity in cart
    Given the cart has 1 product
    When the user increases the product quantity
    Then the cart item quantity should be 2

  @regression
  Scenario: Remove product from cart
    Given the cart has 1 product
    When the user removes the product from the cart
    Then the cart should be empty
