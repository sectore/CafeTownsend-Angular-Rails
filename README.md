#AngularJS + Rails port of Cafe Townsend application

##About
[AngularJS](http://http://angularjs.org/) and [Rails](http://rubyonrails.org/) port of the famous Cafe Townsend application originally written in ActionScript.

The application covers the following topics:

*  Angular and Rails
*  Angulars [Modules](http://docs.angularjs.org/guide/module)
*  Angulars [Services](http://docs.angularjs.org/guide/dev_guide.services)
*  Sharing data beetween controllers using services, which are acting as Domain Models
*  Angulars new animation directive [ngAnimate](http://code.angularjs.org/1.1.4/docs/api/ng.directive:ngAnimate)
*  Mixins by [Bourbon](http://bourbon.io)


##Demo (YouTube)
[![Click on screen shot to see live demo on YouTube](https://github.com/sectore/CafeTownsend-Angular-Rails/raw/master/wiki/cafetownsend-angular-rails-youtube.png "Login")](https://www.youtube.com/watch?v=PCFUKOiThJA)

##Demo (Heroku)
[http://cafetownsend-angular-rails.herokuapp.com](http://cafetownsend-angular-rails.herokuapp.com/)

##Local installation
1) Open Terminal

	git clone git://github.com/sectore/CafeTownsend-Angular-Rails.git
	cd CafeTownsend-Angular-Rails
	bundle install --without production
	rake db:migrate
	rake db:seed
	rails server

2) Open [http://localhost:3000](http://localhost:3000/) using [Chrome](https://www.google.com/chrome)

##Version history
Check the [CHANGELOG file](https://raw.github.com/sectore/CafeTownsend-Angular-Rails/master/CHANGELOG.md) for details, please.

##License
`CafeTownsend-Angular-Rails` is licensed for use under the terms of the MIT License. Check the [LICENSE file](https://raw.github.com/sectore/CafeTownsend-Angular-Rails/master/LICENSE.md) for details, please.