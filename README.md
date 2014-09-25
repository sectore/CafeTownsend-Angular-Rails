#STILL IN PROGRESS...


#AngularJS (v.1.3.0-rc.3) + Rails (v.4.1.5) port of Cafe Townsend application


##About
[AngularJS](http://http://angularjs.org/) and [Rails](http://rubyonrails.org/) port of the famous Cafe Townsend application originally written in ActionScript.

The application covers the following topics:

*  Angular and Rails
*  Angulars [Modules](http://docs.angularjs.org/guide/module)
*  Angulars [Services](http://docs.angularjs.org/guide/dev_guide.services)
*  Sharing data beetween controllers using services, which are acting as Domain Models
*  Angulars animation directive [ngAnimate](http://code.angularjs.org/1.1.4/docs/api/ng.directive:ngAnimate)
*  Testing an Angular application using [PhantomJS](http://phantomjs.org/), [Mocha](http://visionmedia.github.io/mocha/), [SinonJS](http://sinonjs.org/) etc.
*  Mixins by [Bourbon](http://bourbon.io)

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
* [Mocha](http://visionmedia.github.io/mocha/)
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
	rails server

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
Check the [CHANGELOG file](https://github.com/sectore/CafeTownsend-Angular-Rails/blob/master/CHANGELOG.md) for details, please.

##License
`CafeTownsend-Angular-Rails` is licensed for use under the terms of the MIT License. Check the [LICENSE file](https://github.com/sectore/CafeTownsend-Angular-Rails/blob/master/LICENSE.md) for details, please.

##Author
Jens Krause // [WEBSECTOR.DE](http://www.websector.de)

[![Build Status](https://travis-ci.org/sectore/CafeTownsend-Angular-Rails.png?branch=master)](https://travis-ci.org/sectore/CafeTownsend-Angular-Rails/)

