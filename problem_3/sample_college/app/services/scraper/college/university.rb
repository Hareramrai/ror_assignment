module Scraper
  module College
    class University
  
      def initialize raw_data, page
        @raw_data = raw_data
        @page = page
        college_profile
      end  
      
      def parse 
        {
          name: name,
          rank: rank,
          tuition_fees: tuition_fees,
          total_enrollment: total_enrollment,
          acceptance_rate: acceptance_rate,
          average_retention_rates: retention_rate,
          graduation_rate: graduation_rate
        } 
      end
  
      private   
      def name 
        @raw_data.at('div.text-strong.text-large.block-tighter a').text
      end
      
      def rank 
        rank_str = @raw_data.at("td.full-width div.text-small span.text-strong").text
        if rank_str.gsub(/[^\d]/, '').blank?
          rank_str
        else
          rank_str.gsub(/[^\d]/, '').to_i
        end 
      end
      
      def tuition_fees 
        @raw_data.at('td.text-right div').text.strip
      end
      
      def total_enrollment 
        @raw_data.at('td.text-right:nth-child(3)').text.gsub(/[^\d]/, '')
      end
      
      def acceptance_rate 
        @page.search('[data-test-id="r_c_accept_rate"]').text
      end
      
      def graduation_rate 
        @page.search('[data-test-id="grad_rate_4_year"]').text
      end
      
      def retention_rate 
        str = @page.search(".block-looser h3.heading-large.block-normal+p")[1].text
        if str =~ /retention/i
          str.scan(/\d+/).last.to_i
        else
          'NA'
        end
      end
      
      def college_profile
        @page = @page.link_with(:text => name ).click
      end
    end
  end
end