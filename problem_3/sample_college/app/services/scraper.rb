require 'json_writer'
module Scraper
  module College
    class Fetcher
      include JsonWriter
      attr_reader :page
      
      def initialize options={}
        @options = options
        url = @options[:url] || 'http://colleges.usnews.rankingsandreviews.com/best-colleges/rankings/national-universities/data'
        agent = Mechanize.new 
        @page = agent.get url
        @list_of_university = []
      end  
          
      def fetch
        data.each do |raw_data|
          university = Scraper::College::University.new raw_data, @page
          @list_of_university << university.parse
        end
        check_for_next_page
      end
      
      private       
      def check_for_next_page
        if load_more && !@options[:first_page]
          @page = @page.link_with(text: load_more.text).click
          #we are going to add new records
          puts "Going to load next set of records"
          fetch
        else
          file_path = @options[:file_path] || 'public/colleges.json'
          add_to_file file_path, @list_of_university
        end
      end  
      
      def load_more 
        @page.at "div[data-view='colleges-search-more-button'] a:last"
      end  
        
      def data
        @page.search(".flex-table tbody tr:not(.search-results-ad-wrapper)")
      end
    end
  end
end
