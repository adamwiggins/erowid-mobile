require 'bundler/setup'
require 'test/unit'

require './erowid-scraper'

class ErowidScraperTest < Test::Unit::TestCase
  def test_url
    assert_match /erowid.org/, ErowidScraper.new('mdma').url
  end

  def test_scrape
    p = ErowidScraper.new('mdma')

    assert_equal "MDMA", p.name
    assert_match /XTC/, p.common_names
    assert_match /Empathogen/, p.effects
    assert_equal "3,4-methylenedioxymethamphetamine", p.chemical_name
    assert_match /psychotherapy/, p.description
  end

  def test_common_psychoactives
    assert_equal "Alcohol", ErowidScraper.common_psychoactives[0].name
    assert_equal "alcohol", ErowidScraper.common_psychoactives[0].slug
    assert_match /alcohol/, ErowidScraper.common_psychoactives[0].path
  end
end
