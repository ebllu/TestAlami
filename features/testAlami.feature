
Feature: Test Alami

  @elevania
  Scenario: User added item to cart

    Given user had been on landing page elevania
    And user search komputer on search type
    And user select tab produk terlaris
    And  user add item to cart with 3 quantity
    When user cancel to change courier
    And user delete item from the cart
    Then the popup confirmations will have displayed
