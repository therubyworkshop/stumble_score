StumbleScore
============

Google Keys
===========

    AIzaSyANae0s1I9yJ-sdhy1ghFAg0j4B0Po3AA4

    AIzaSyDR7kyOHOKmbWVXV77JH1riDFe3EL67ntY

    AIzaSyCDSMOFAhXfuZvvK8Z2uEzovnbOgsh8iBI

    AIzaSyC5gss4v7v1MUCu4RyEWWXigta_vitTwz8


Exercises for The Ruby Workshop
-------------------------------

# Setup

1. Visit [github.com/therubyworkshop/stumble_score](http://github.com/therubyworkshop/stumble_score)
2. Click [ZIP](https://github.com/therubyworkshop/stumble_score/zipball/master) to download project
3. Unzip the file
4. Rename the folder to `stumble_score` and move it where it'll be easy to find
5. Open up your terminal
6. `cd /path/to/stumble_score/`
7. `gem install json_pure sinatra heroku rack-test`

# Running the tests

One at a time

    ruby test/test_01_cli_greeting.rb

All at once

    rake test

# Running the Command Line Interface (CLI)

    ./bin/stumble_score 1 Penn Square Philadelphia, PA 19107

# Running the web app locally

    ruby lib/web.rb

Visit [http://localhost:4567/?address=rittenhouse%20square,%20pa](http://localhost:4567/?address=rittenhouse%20square,%20pa)

# Deploy to the internets

1. Sign up with heroku
2. Visit [api.heroku.com/signup](https://api.heroku.com/signup)
3. Confirm email
4. Create password
5. (If you don't have git installed, install the Toolbelt)
6. `gem install heroku`
7. `heroku login`
8. `heroku create --stack cedar`
9. `git push heroku master`
10. Visit goofy URL
11. Profit

