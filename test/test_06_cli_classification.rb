require File.expand_path(File.join('..', 'test_helper'), __FILE__)

class TestCLI < Test::Unit::TestCase
  include LocationFixtures

  def test_cli_displays_classification_of_specified_address
    output = CLI.run(CHESTNUT_HILL)
    assert output.include?("Classified as: #{CHESTNUT_HILL_CLASSIFICATION}"),
      "TODO display classification in CLI for specified address."

    output = CLI.run(PAOLI)
    assert output.include?("Classified as: #{PAOLI_CLASSIFICATION}"),
      "That's odd. The classification works for one address but not another."

    output = CLI.run(RITTENHOUSE)
    assert output.include?("Classified as: #{RITTENHOUSE_CLASSIFICATION}"),
      "That's odd. The classification works in two addresses but not a third."
  end

end

class TestLocation < Test::Unit::TestCase
  include LocationFixtures

  def test_classification_describes_specified_address
    location = StumbleScore::Location.new(CHESTNUT_HILL)
    assert_equal CHESTNUT_HILL_CLASSIFICATION, location.classification

    location = StumbleScore::Location.new(PAOLI)
    assert_equal PAOLI_CLASSIFICATION, location.classification

    location = StumbleScore::Location.new(RITTENHOUSE)
    assert_equal RITTENHOUSE_CLASSIFICATION, location.classification
  end

end
