require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    students=doc.css('div.student-card').map do |card|
       {:name => card.css('h4.student-name').text,
       :location => card.css('p.student-location').text,
       :profile_url => card.css('a').attribute('href').value}
    end
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
    # binding.pry
    
    {
      :linkedin=>doc.css('div.social-icon-container').css('a')[1].attribute('href').value,
      :github=>doc.css('div.social-icon-container').css('a')[2].attribute('href').value,
      :blog=>"http://flatironschool.com",
      :profile_quote=>"\"Forget safety. Live where you fear to live. Destroy your reputation. Be notorious.\" - Rumi",
      :bio=> "I'm a school"
     }
  end

end

