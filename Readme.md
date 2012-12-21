# Erowid mobile site mockup

This is a mockup of a mobile site for the drug information site erowid.org.

## Run locally

Make sure you have Ruby 1.9.3, Rubygems, Bundler, and Foreman.  Then:

    $ bundle
    $ foreman start
    $ open http://localhost:5000/

## Tests

This tests the scraping functionality, which is likely to be fragile since it depends on the HTML structure and URL scheme on Erowid.

To run the automated tests:

    $ ruby test.rb

## Deploy

Deploy to Heroku:

    $ heroku create
    $ git push heroku master
    $ heroku open

## Meta

Written by Adam Wiggins, released under the MIT license.

"Erowid" is a registered trademark of Erowid, and the Erowid logo image is
copyright Erowid.  See: http://www.erowid.org/general/about/about_copyrights.shtml

