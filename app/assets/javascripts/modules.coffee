# register all modules
angular.module 'cafeTownsend.services', ['ngResource', 'ng-rails-csrf', 'rails']
angular.module 'cafeTownsend', ['cafeTownsend.services']
