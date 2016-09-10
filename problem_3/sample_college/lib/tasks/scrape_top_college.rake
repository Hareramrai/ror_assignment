namespace :scrape_data do
  
  desc "scrape top colleges data from US News college page (all pages)"
  task :fetch_top_colleges => :environment do
    fetcher = Scraper::College::Fetcher.new 
    fetcher.fetch
  end
  
end
