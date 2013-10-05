# register all modules
angular.module('cafeTownsend.services', [
  'ngRoute'
  'ngAnimate'
  'ngResource'
  'rails'
  'ng-rails-csrf'
])

angular.module('cafeTownsend', [
  'cafeTownsend.services'
])