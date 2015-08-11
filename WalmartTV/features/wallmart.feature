Feature: Search product in the Wallmart site
  Scenario: I access the website and search tv
    Given I have entered "tv" into the query
    When I click "search-icon"
    Then I expect see some results