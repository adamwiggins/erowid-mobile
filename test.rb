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

    assert_equal "MDMA", JSON.parse(@psychoactive.to_json)['name']
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

  def test_tokenize
    assert_equal "5meodmt", ErowidScraper.tokenize("5-MeO-DMT")
    assert_equal "mdma ecstasy", ErowidScraper.tokenize("MDMA (Ecstasy)")
    assert_equal "one two", ErowidScraper.tokenize("  one   two   ")
  end

  def test_search
    assert_equal 'morning-glory', ErowidScraper.search('glory')
    assert_equal '2c-b', ErowidScraper.search('2cb')
    assert_equal 'mushrooms', ErowidScraper.search('shrooms')
  end
end
