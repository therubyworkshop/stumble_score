require File.expand_path(File.join('..', 'test_helper'), __FILE__)

module LocationFixtures
  CHESTNUT_HILL           = "19118"
  CHESTNUT_HILL_BAR_COUNT = 10
  PAOLI                   = "19301"
  PAOLI_BAR_COUNT         = 5
  RITTENHOUSE             = "19103"
  RITTENHOUSE_BAR_COUNT   = 20
end

class TestCLI < Test::Unit::TestCase
  include LocationFixtures

  def test_cli_displays_number_of_bars_near_specified_address
    output = StumbleScore::CLI.run(CHESTNUT_HILL)
    assert output.include?("Bars nearby: #{CHESTNUT_HILL_BAR_COUNT}"),
      "TODO display number of bars in CLI for specified address."

    output = StumbleScore::CLI.run(PAOLI)
    assert output.include?("Bars nearby: #{PAOLI_BAR_COUNT}"),
      "That's odd. The specified number of bars works for one address but not another."

    output = StumbleScore::CLI.run(RITTENHOUSE)
    assert output.include?("Bars nearby: #{RITTENHOUSE_BAR_COUNT}"),
      "That's odd. The specified number of bars works in two addresses but not a third."
  end

end

class TestLocation < Test::Unit::TestCase
  include LocationFixtures

  def test_bar_count_finds_number_of_bars_near_specified_address
    location = StumbleScore::Location.new(CHESTNUT_HILL)
    assert_equal CHESTNUT_HILL_BAR_COUNT, location.bar_count

    location = StumbleScore::Location.new(PAOLI)
    assert_equal PAOLI_BAR_COUNT, location.bar_count

    location = StumbleScore::Location.new(RITTENHOUSE)
    assert_equal RITTENHOUSE_BAR_COUNT, location.bar_count
  end

end
