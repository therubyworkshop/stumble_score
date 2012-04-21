require File.expand_path(File.join('..', 'test_helper'), __FILE__)

class TestCLI < Test::Unit::TestCase

  def test_cli_includes_address
    address    = "1 Penn Square Philadelphia, PA 19107"
    cli_output = StumbleScore::CLI.run(address)
    assert cli_output.include?(address),
      "TODO display specified address in CLI. " \
      "(HINT: look at the run() method in stumble_score.rb)"
  end

end
