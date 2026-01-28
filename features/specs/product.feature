@critical
Feature: Product

    @regression
    Scenario: Open Mobiles category and list products
        Given the user is on the home screen
        When the user opens the "Mobiles" category
        Then the product list should be displayed
