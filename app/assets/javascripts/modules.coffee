# register all modules
angular.module 'cafeTownsend.services', ['ngResource', 'ng-rails-csrf']
angular.module 'cafeTownsend', ['cafeTownsend.services']
