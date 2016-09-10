require 'test_helper'
class FetcherTest < ActiveSupport::TestCase
  
  test 'it respond to fetch call' do
    fetcher = Scraper::College::Fetcher.new 
    assert_respond_to fetcher, :fetch
  end

  test 'it works with file path option' do
    fetcher = Scraper::College::Fetcher.new file_path: 'tmp/colleges.json', first_page: true
    fetcher.fetch
    assert File.file? 'tmp/colleges.json'
  end
  
  test 'it works with first_page option' do
    file_location = 'tmp/colleges_first_page.json'
    fetcher = Scraper::College::Fetcher.new file_path: file_location, first_page: true
    fetcher.fetch
    ##  load colleges from json to check number of records
    require 'json'
    colleges = JSON.parse(File.read(file_location))
    assert colleges.length < 30
  end
  
  
end