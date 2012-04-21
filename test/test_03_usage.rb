require File.expand_path(File.join('..', 'test_helper'), __FILE__)

class TestCLI < Test::Unit::TestCase

  def test_cli_displays_usage_instructions_when_no_address_specified
    cli_output = StumbleScore::CLI.run
    assert_match /usage/i, cli_output,
      "TODO display usage instructions in CLI when no address is specified. " \
      "(HINT: use the word \"usage\" to make this test pass."
  end

end
