require File.expand_path(File.join('..', 'test_helper'), __FILE__)

class TestCLI < Test::Unit::TestCase
  include LocationFixtures

  def test_cli_displays_stumble_score_for_specified_address
    output = CLI.run(CHESTNUT_HILL)
    assert output.include?("StumbleScore: #{CHESTNUT_HILL_SCORE}"),
      "TODO display StumbleScore in CLI for specified address."

    output = CLI.run(PAOLI)
    assert output.include?("StumbleScore: #{PAOLI_SCORE}"),
      "That's odd. The StumbleScore works for one address but not another."

    output = CLI.run(RITTENHOUSE)
    assert output.include?("StumbleScore: #{RITTENHOUSE_SCORE}"),
      "That's odd. The StumbleScore works in two addresses but not a third."
  end

end

class TestLocation < Test::Unit::TestCase
  include LocationFixtures

  def test_bar_count_finds_number_of_bars_near_specified_address
    location = StumbleScore::Location.new(CHESTNUT_HILL)
    assert_equal CHESTNUT_HILL_SCORE, location.score

    location = StumbleScore::Location.new(PAOLI)
    assert_equal PAOLI_SCORE, location.score

    location = StumbleScore::Location.new(RITTENHOUSE)
    assert_equal RITTENHOUSE_SCORE, location.score
  end

end

