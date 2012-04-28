require File.expand_path(File.join('..', 'test_helper'), __FILE__)

class TestCLI < Test::Unit::TestCase
  include LocationFixtures

  def test_cli_lists_bar_names_near_specified_address
    output = CLI.run(CHESTNUT_HILL)
    assert output.include?(CHESTNUT_HILL_BAR),
      "TODO list bars in CLI near specified address."

    output = CLI.run(PAOLI)
    assert output.include?(PAOLI_BAR),
      "That's odd. The bar list works for one address but not another."

    output = CLI.run(RITTENHOUSE)
    assert output.include?(RITTENHOUSE_BAR),
      "That's odd. The bar list works in two addresses but not a third."
  end

end

class TestLocation < Test::Unit::TestCase
  include LocationFixtures

  def test_bar_names_lists_bars_near_specified_address
    location = StumbleScore::Location.new(CHESTNUT_HILL)
    bar_names = location.bar_names
    assert bar_names.include?(CHESTNUT_HILL_BAR),
      "#{bar_names.inspect} does not include #{CHESTNUT_HILL_BAR}"


    location = StumbleScore::Location.new(PAOLI)
    bar_names = location.bar_names
    assert bar_names.include?(PAOLI_BAR),
      "#{bar_names.inspect} does not include #{PAOLI_BAR}"

    location = StumbleScore::Location.new(RITTENHOUSE)
    bar_names = location.bar_names
    assert bar_names.include?(RITTENHOUSE_BAR),
      "#{bar_names.inspect} does not include #{RITTENHOUSE_BAR}"
  end

end
