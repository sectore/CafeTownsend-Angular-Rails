#AngularJS (v.1.3.8) + Rails (v.4.2.0) port of Cafe Townsend application

[![Build Status](https://travis-ci.org/sectore/CafeTownsend-Angular-Rails.png?branch=master)](https://travis-ci.org/sectore/CafeTownsend-Angular-Rails/)

##About
[AngularJS](http://http://angularjs.org/) and [Rails](http://rubyonrails.org/) port of the famous Cafe Townsend application originally written in ActionScript.

The application covers the following topics:

*  Angular and Rails
*  Angulars [Modules](http://docs.angularjs.org/guide/module)
*  Angulars [Services](http://docs.angularjs.org/guide/dev_guide.services)
*  Sharing data beetween controllers using services, which are acting as Domain Models
*  Angulars animation directive [ngAnimate](http://code.angularjs.org/1.1.4/docs/api/ng.directive:ngAnimate)
*  Angular and [form validation](http://www.yearofmoo.com/2014/09/taming-forms-in-angularjs-1-3.html)
*  Testing an Angular application using [PhantomJS](http://phantomjs.org/), [Mocha](http://mochajs.org/) and [SinonJS](http://sinonjs.org/)
*  Testing a Rails application using [RSpec](http://rspec.info/) and [factory_girl](https://github.com/thoughtbot/factory_girl)
*  Styling (CSS) by using mixins of [Bourbon](http://bourbon.io)


##Demo (YouTube)
[![Click on screen shot to see live demo on YouTube](https://github.com/sectore/CafeTownsend-Angular-Rails/raw/master/wiki/cafetownsend-angular-rails-youtube.png "Login")](https://www.youtube.com/watch?v=PCFUKOiThJA)


##Demo (Heroku)
[http://cafetownsend-angular-rails.herokuapp.com](http://cafetownsend-angular-rails.herokuapp.com/)


##Tools and Libraries (in alphabetical order)

* [AngularJS](http://angularjs.org)
* [angularjs-rails-resource](https://github.com/tpodom/angularjs-rails-resource)
* [Bourbon](bourbon.io)
* [CoffeeScript](http://coffeescript.org/)
* [ng-rails-csrf](https://github.com/xrd/ng-rails-csrf)
* [Rails](http://rubyonrails.org/)
* [Sass](http://sass-lang.com/)

For testing purposes:

* [expect.js](https://github.com/LearnBoost/expect.js)
* [factory_girl](https://github.com/thoughtbot/factory_girl)
* [Guard](https://github.com/guard/guard)
* [Mocha](http://mochajs.org/)
* [PhantomJS](http://phantomjs.org/)
* [RSpec](http://rspec.info/)
* [SinonJS](http://sinonjs.org/)
* [Teaspoon](https://github.com/modeset/teaspoon)


##Local installation
1) Open Terminal

	git clone git://github.com/sectore/CafeTownsend-Angular-Rails.git
	cd CafeTownsend-Angular-Rails
	bundle install --without production
	bower install
	rake db:migrate
	rake db:seed
	spring rails s

2) Open [http://localhost:3000](http://localhost:3000/) using [Chrome](https://www.google.com/chrome)


##Tests

Note: Make sure that you have [PhantomJS](http://phantomjs.org/) installed on your machine.

Before running tests match the development schema to the test database (only once)

    rake db:test:clone

Running Rails specs using [Spring](https://github.com/rails/spring):

    spring rspec


Running JavaScript specs using [Spring](https://github.com/rails/spring):

    spring teaspoon


Running all tests with [Guard](https://github.com/guard/guard) and [Spring](https://github.com/rails/spring)

    guard


##Version history
[CHANGELOG](https://github.com/sectore/CafeTownsend-Angular-Rails/blob/master/CHANGELOG.md)

##License
[MIT](https://github.com/sectore/CafeTownsend-Angular-Rails/blob/master/LICENSE.md).

## Contributors
- [Oleg Orlov](https://github.com/OrelSokolov)
- [melnikovsansan](https://github.com/melnikovsansan)

##Author
Jens Krause // [WEBSECTOR.DE](http://www.websector.de)
