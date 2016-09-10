require 'test_helper'
class UniversityTest < ActiveSupport::TestCase
  include JsonDeepCompare::Assertions
  
  def setup
    file_location = 'tmp/colleges_first_page.json'
    fetcher = Scraper::College::Fetcher.new file_path: file_location, first_page: true
    data = fetcher.send :data
    @university = Scraper::College::University.new data.first, fetcher.page
  end
  
  test 'it respond to parse' do
    assert_respond_to @university, :parse
  end

  test 'it returns valid college info' do
    colleges = YAML::load_file File.join(Rails.root, '/test/fixtures/university.yml')
    colleges.deep_symbolize_keys!
    assert_json_equal @university.parse, colleges[:princeton_university]
  end
  
end