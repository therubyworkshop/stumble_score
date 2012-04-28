require File.expand_path(File.join('..', 'test_helper'), __FILE__)

class TestCLI < Test::Unit::TestCase

  def test_cli_greets_user_when_run
    cli_output = CLI.run("Philadelphia, PA")
    assert_match /Welcome to StumbleScore/i, cli_output,
      "TODO Add a nice greeting to our CLI. " \
      "(HINT: look at the run() method in stumble_score.rb)"
  end

end
