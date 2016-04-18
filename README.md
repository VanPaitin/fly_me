# Fly_me

[![Code Climate](https://codeclimate.com/github/andela-mpitan/fly_me/badges/gpa.svg)](https://codeclimate.com/github/andela-mpitan/fly_me)  [![Test Coverage](https://codeclimate.com/github/andela-mpitan/fly_me/badges/coverage.svg)](https://codeclimate.com/github/andela-mpitan/fly_me/coverage) [![Circle CI](https://circleci.com/gh/andela-mpitan/fly_me.svg?style=svg)](https://circleci.com/gh/andela-mpitan/fly_me)

## Introduction
Hi everyone,
I have implemented a flight booking system with rails.
With this app, you can search for flights within a limited number of days.

The  number of passengers you select at the home page will not have any effect on the booking form. You are given a chance to dynamically add passengers depending on your needs. On successful booking of a flight, you will be taking to a page where you know the price charged and you can see your registered passenger(s) details. You will also recieve a booking-success email.

The app has features to handle cancelling a booking before the day of the flight and also managing the number of passengers on a booking.
You will also recieve a booking update email if you choose to manage your app.

Bug discoveries, suggestions and general feedback will always be appreciated.


## Getting Started
Getting started is extremely easy, you can either clone / fork this repository or download the entire project as a zip package and run locally.

## Dependencies
This project is implemented using the rails framework and as such in order to effectively run this project locally, you need to have a version of Rails running on your local development machine. You also need to make sure that you have the Ruby programming language installed as rails is written in ruby.

* [Get Ruby Here](http://www.ruby-lang.org/)
* [Get Rails Here](http://rubyonrails.org/)

You also need to make sure that you have rubygems and bundler installed. RubyGems is a package management framework for Ruby and bundler is a ruby gem that helps to manage other external dependencies in a rails application.

* [Get Rubygems Here](https://rubygems.org/pages/download)
* [Get Bundler Here](http://bundler.io/)

Once you have a copy of this project and it's dependencies installed, you are good. Start up your terminal, navigate to the project directory and run the following command to install all the required external dependencies.

`bundle`

Once done, run the following command to prepare the database on your machine.

`rake db:migrate`

Then run the following command to preload the database with data.

`rake db:seed`



** Note: To view the project in a web browser, you need to get the rails server up and running. Run the following command from the terminal and browse to the generated link from a web browser.

`rails s`

## Running the tests.

After all the setting up as mentioned above, you can run the tests. The tests are driven by rspec, capybara and selenium. You can get them fired up by running the following command from the terminal.

`rspec spec`

or

`bundle exec rspec`

or

`rake`

If you need more specific tests, then specify the absolute path to the spec file:

`bundle exec rspec spec/models/booking_spec.rb`

If you want the tests to read more like a document then pass in these options to the rspec command:

`bundle exec rspec spec/models/booking_spec.rb -f documentation`

## Application features
* Flight search.
* Flight booking.
* Booking cancellation before flight date.
* Viewing past booking.
* Manage bookings by adding or deleting passengers.
* Efficient Email notification.
* User can add or remove passenger on booking page.

## Application Limitations
The app is a work in progress, as such, it has the following limitations among others.

* Payment has not been integrated into the site. So payment has to be done manually
* The app does not have its own authenticaton system and relies on third-party apps for authentication of users integrity
* The website use of design libraries is minimal and heavily employs just basic HTML/CSS
* App doesn't have a private domain name yet.


## Project Website
Click [here](https://fly-me.herokuapp.com/) to proceed to **Fly-me**.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/andela-mpitan/fly-me.

* [Fork it]( https://github.com/andela-mpitan/fly-me/fork)
* Create your feature branch (git checkout -b my-new-feature)
* Commit your changes __*(git commit -am 'Add some feature')*__
* Push to the branch (git push origin my-new-feature)
* Create a new Pull Request