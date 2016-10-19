# Hefesto

# ![hefesto](app/assets/images/hefesto.jpg)

> Your personal worker

This is an app to manage the home office days of your team. It's a simple
calendar that you and your coworkers can schedule the days you are going to work
at home.

### Installing dependencies

This project uses:
 -  The 2.3.0 Ruby version.
 -  The 5.0.0.1 Rails version.

You can install ruby with [RVM](https://rvm.io/rvm/install) and then install the
correct version of Ruby:

        $ rvm install ruby-2.3.0

Install dependencies using bundler like above:

        $ bundle install

In case you don't have bundler:

        $ gem bundler install

PhantomJS is a dependency from poltergeist gem, you can install it here:

   [http://phantomjs.org/download.html](http://phantomjs.org/download.html)

#### Automated tests with RSpec

You can run all tests using:

        $ rspec

#### Running in your local machine

You can run like above:

        $ rails server

And then access the link [http://localhost:3000/](http://localhost:3000/) in
your browser.

