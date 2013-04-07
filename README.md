#AngularJS (v.1.1.4) + Rails (v.3.2.13) port of Cafe Townsend application

##About
[AngularJS](http://http://angularjs.org/) and [Rails](http://rubyonrails.org/) port of the famous Cafe Townsend application originally written in ActionScript.

The application covers the following topics:

*  Angular and Rails
*  Angulars [Modules](http://docs.angularjs.org/guide/module)
*  Angulars [Services](http://docs.angularjs.org/guide/dev_guide.services)
*  Sharing data beetween controllers using services, which are acting as Domain Models
*  Angulars new animation directive [ngAnimate](http://code.angularjs.org/1.1.4/docs/api/ng.directive:ngAnimate)
*  Mixins by [Bourbon](http://bourbon.io)


##Screen shots
[![Click on screen shot to see live demo on Heroku](https://github.com/sectore/CafeTownsend-Angular-Rails/raw/master/wiki/cafetownsend-angular-rails-login.png "Login")](http://cafetownsend-angular-rails.herokuapp.com/)

[![Click on screen shot to see live demo on Heroku](https://github.com/sectore/CafeTownsend-Angular-Rails/raw/master/wiki/cafetownsend-angular-rails-overview.png "Overview")](http://cafetownsend-angular-rails.herokuapp.com/)

[![Click on screen shot to see live demo on Heroku](https://github.com/sectore/CafeTownsend-Angular-Rails/raw/master/wiki/cafetownsend-angular-rails-edit.png "Edit")](http://cafetownsend-angular-rails.herokuapp.com/)


##Live example
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

##License
Copyright (c) 2012-2013 "sectore" Jens Krause // [WEBSECTOR.DE](http://www.websector.de)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
