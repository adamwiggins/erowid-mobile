require 'nokogiri'
require 'restclient'

class ErowidScraper
  attr_reader :url
 
  def initialize(psychoactive)
    @url = "http://www.erowid.org/chemicals/#{psychoactive}/#{psychoactive}.shtml"
    puts "Scraping #{@url}"
    @page = Nokogiri::HTML(RestClient.get(@url))
  end

  def name
    @page.css('div.ts-substance-name')[0].text
  end

  def common_names
    @page.css('div.sum-common-name')[0].text
  end

  def effects
    @page.css('div.sum-effects')[0].text
  end

  def chemical_name
    @page.css('div.sum-chem-name')[0].text
  end

  def description
    @page.css('div.sum-description')[0].text
  end
end
