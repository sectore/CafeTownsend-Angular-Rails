# register all modules
angular.module('cafeTownsend.services', [
  'ngRoute'
  'ngAnimate'
  'ngResource'
  'rails'
  'ng-rails-csrf'
  'cafeTownsend.employee'
])

angular.module('cafeTownsend', [
  'cafeTownsend.services'
])