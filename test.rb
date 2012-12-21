require 'bundler/setup'
require 'test/unit'

require './erowid_scraper'

class ErowidScraperTest < Test::Unit::TestCase
  def test_bad_slug
    assert_nil ErowidScraper.scrape('this-does-not-exist')
  end

  def test_scrape_mdma
    @psychoactive = ErowidScraper.scrape('mdma')

    assert_match /erowid.org/, @psychoactive.url

    assert_equal "MDMA", @psychoactive.name
    assert_match /XTC/, @psychoactive.common_names
    assert_match /Empathogen/, @psychoactive.effects
    assert_equal "3,4-methylenedioxymethamphetamine", @psychoactive.chemical_name
    assert_match /psychotherapy/, @psychoactive.description

    assert_equal 'http://www.erowid.org/chemicals/mdma/images/mdma_summary1.jpg', @psychoactive.image_url
  end

  def test_scrape_amantias
    @psychoactive = ErowidScraper.scrape('amanitas')

    assert_nil @psychoactive.chemical_name
  end

  def test_common_psychoactives
    assert_equal "Alcohol", ErowidScraper.common_psychoactives['alcohol'].name
    assert_equal "alcohol", ErowidScraper.common_psychoactives['alcohol'].slug
    assert_match /alcohol/, ErowidScraper.common_psychoactives['alcohol'].path
  end
end
