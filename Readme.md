# Erowid mobile site prototype

This is a prototype of a possible mobile site design for [Erowid.org][1].

## Run locally

[Install Ruby 1.9.3](http://www.ruby-lang.org/en/downloads/) and
[Bundler](http://gembundler.com/).  Then:

    $ bundle
    $ ruby web.rb
    $ open http://localhost:5000/

## Tests

This tests the scraping functionality, which is likely to be fragile since it
depends on the HTML structure and URL scheme on Erowid.

To run the automated tests:

    $ ruby test.rb
    Loaded suite test
    6 tests, 20 assertions, 0 failures, 0 errors
    100% passed

## Deploy

[Get a Heroku account][2] and install the [Heroku Toolbelt][3].  Then:

    $ heroku create
    $ git push heroku master
    $ heroku open

## API

The app provides a faux JSON API based on scraped data.  Access like this:

    $ curl http://localhost:5000/psychoactives/alcohol.json
    {
      "name": "Alcohol",
      "common_names": "Liquor; Spirits; Beer; Wine",
      "effects": "Depressant Intoxicant",
      "chemical_name": "ethyl-alcohol",
      "description": "Alcohol is one of the most common strong psychoactives used by humans.  It has a long history of use and its intoxicating effects are well-studied and -documented.",
      "image_url": "http://www.erowid.org/chemicals/alcohol/images/alcohol_summary1.jpg"
    }

## Meta

Written by Adam Wiggins, released under the [MIT license].

["Erowid" is a registered trademark of Erowid, and the Erowid logo image is
copyright Erowid.][5]

[1]: https://www.erowid.org/
[2]: https://api.heroku.com/signup
[3]: https://toolbelt.heroku.com/
[4]: http://opensource.org/licenses/MIT
[5]: https://www.erowid.org/general/about/about_copyrights.shtml

