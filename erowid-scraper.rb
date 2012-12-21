require 'nokogiri'
require 'restclient'
require 'ostruct'

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

  def self.common_psychoactives
    [
      OpenStruct.new(:name => 'Alcohol', :slug => 'alcohol', :path => '/chemicals/alcohol/alcohol.shtml'),
      OpenStruct.new(:name => 'Amanitas', :slug => 'amanitas', :path => '/plants/amanitas/amanitas.shtml'),
      OpenStruct.new(:name => 'AMT', :slug => 'amt', :path => '/chemicals/amt/amt.shtml'),
      OpenStruct.new(:name => 'Ayahuasca', :slug => 'ayahuasca', :path => '/chemicals/ayahuasca/ayahuasca.shtml'),
      OpenStruct.new(:name => 'Cacti', :slug => 'cacti', :path => '/plants/cacti/cacti.shtml'),
      OpenStruct.new(:name => 'Caffeine', :slug => 'caffeine', :path => '/chemicals/caffeine/caffeine.shtml'),
      OpenStruct.new(:name => 'Cannabis', :slug => 'cannabis', :path => '/plants/cannabis/cannabis.shtml'),
      OpenStruct.new(:name => 'Cocaine', :slug => 'cocaine', :path => '/chemicals/cocaine/cocaine.shtml'),
      OpenStruct.new(:name => 'Datura', :slug => 'datura', :path => '/plants/datura/datura.shtml'),
      OpenStruct.new(:name => 'DMT', :slug => 'dmt', :path => '/chemicals/dmt/dmt.shtml'),
      OpenStruct.new(:name => 'DXM', :slug => 'dxm', :path => '/chemicals/dxm/dxm.shtml'),
      OpenStruct.new(:name => 'GHB', :slug => 'ghb', :path => '/chemicals/ghb/ghb.shtml'),
      OpenStruct.new(:name => 'Heroin', :slug => 'heroin', :path => '/chemicals/heroin/heroin.shtml'),
      OpenStruct.new(:name => 'Inhalants', :slug => 'inhalants', :path => '/chemicals/inhalants/inhalants.shtml'),
      OpenStruct.new(:name => 'Kava', :slug => 'kava', :path => '/plants/kava/kava.shtml'),
      OpenStruct.new(:name => 'Ketamine', :slug => 'ketamine', :path => '/chemicals/ketamine/ketamine.shtml'),
      OpenStruct.new(:name => 'LSD', :slug => 'lsd', :path => '/chemicals/lsd/lsd.shtml'),
      OpenStruct.new(:name => 'MAOIs', :slug => 'maois', :path => '/chemicals/maois/maois.shtml'),
      OpenStruct.new(:name => 'MDMA (Ecstasy)', :slug => 'mdma', :path => '/psychoactives/mdma'),
      OpenStruct.new(:name => 'Mescaline', :slug => 'mescaline', :path => '/chemicals/mescaline/mescaline.shtml'),
      OpenStruct.new(:name => 'Meth', :slug => 'meth', :path => '/chemicals/meth/meth.shtml'),
      OpenStruct.new(:name => 'Morning Glory', :slug => 'morning-glory', :path => '/plants/morning_glory/morning_glory.shtml'),
      OpenStruct.new(:name => 'Mushrooms', :slug => 'mushrooms', :path => '/plants/mushrooms/mushrooms.shtml'),
      OpenStruct.new(:name => 'Nitrous', :slug => 'nitrous', :path => '/chemicals/nitrous/nitrous.shtml'),
      OpenStruct.new(:name => 'Nutmeg', :slug => 'nutmeg', :path => '/plants/nutmeg/nutmeg.shtml'),
      OpenStruct.new(:name => 'Opiates', :slug => 'opiates', :path => '/chemicals/opiates/opiates.shtml'),
      OpenStruct.new(:name => 'Peyote', :slug => 'peyote', :path => '/plants/peyote/peyote.shtml'),
      OpenStruct.new(:name => 'Salvia', :slug => 'salvia', :path => '/plants/salvia/salvia.shtml'),
      OpenStruct.new(:name => 'Spice Products', :slug => 'spice-products', :path => '/plants/spice_product/spice_product.shtml'),
      OpenStruct.new(:name => 'Tobacco', :slug => 'tobacco', :path => '/plants/tobacco/tobacco.shtml'),
      OpenStruct.new(:name => '2C-B', :slug => '2c-b', :path => '/chemicals/2cb/2cb.shtml'),
      OpenStruct.new(:name => '5-MeO-DMT', :slug => '5-meo-dmt', :path => '/chemicals/5meo_dmt/5meo_dmt.shtm')
    ]
  end
end
