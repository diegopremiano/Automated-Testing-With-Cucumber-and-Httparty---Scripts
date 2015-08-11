require "watir-webdriver"
require "rspec/expectations"
require "test-unit"

Given /^I have entered "([^"]*)" into the query$/ do |term|
  @browser ||= Watir::Browser.new :firefox
  @browser.goto "www.wallmart.com.br"
  @browser.text_field(:id => "suggestion-search").set term
end

When /^I click "([^"]*)"$/ do |button_name|
  @browser.button.click
end

Then /^I expect see some results$/ do
  @browser.h1(:class => "search-title").wait_until_present
  @browser.h1(:class => "search-title").should exist
  assert @browser.title == "Busca por tv - Walmart.com"
  @browser.close
end