require "rubygems"
require "test/unit"
require "watir-webdriver"

class GoogleSearch < Test::Unit::TestCase
  def setup
    @browser ||= Watir::Browser.new :firefox
  end

  def teardown
    @browser.close
  end

  def test_search
    @browser.goto "www.wallmart.com.br"
    @browser.text_field(:id => "suggestion-search").set "tv"
    @browser.button.click
    @browser.div(:class => "search-title").wait_until_present
    assert @browser.title == "Busca por tv - Walmart.com"
  end
end