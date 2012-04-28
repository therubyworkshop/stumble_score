# Install

    $ gem install json_pure sinatra heroku rack-test

# Running the CLI

    $ cd /path/to/stumble_score/
    $ ./bin/stumble_score 1 Penn Square Philadelphia, PA 19107

# Running the tests

    $ cd /path/to/stumble_score/
    $ ruby test/test_01_greeting.rb
    $ rake test # to run them all at once

# Running the web app locally

    $ ruby lib/web.rb
    # Visit http://localhost:4567/?address=rittenhouse%20square,%20pa

# Deploy to the internets

    # Sign up with heroku
    # Visit https://api.heroku.com/signup
    # Confirm email
    # Create password
    # (If you don't have git installed, install the Toolbelt)
    $ gem install heroku
    $ heroku login
    $ heroku create --stack cedar
    $ git push heroku master
    # Visit goofy URL

# TODO

+ Stub Net::HTTP
+ Code comments
+ Extra credit: Display google's location name
+ Extra credit: Optional user specified radius
+ Extra credit: Exception handling
+ Extra credit: Form field
+ Extra credit: Non-linear score
+ Test on Windows

# TODO planning

+ Finish code-samples (rename as cheatsheet)
+ Download instructions in READMEs for stumble_score and cheatsheet
+ Set up more google API keys - Greg
+ Compile list of additional resources
