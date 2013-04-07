# register all modules
angular.module 'cafeTownsend.services', ['ngResource', 'rails', 'ng-rails-csrf']
angular.module('cafeTownsend', ['cafeTownsend.services'])