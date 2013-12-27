# register all modules
angular.module('cafeTownsend.services', [
  'ngRoute'
  'ngAnimate'
  'ngResource'
  'rails'
  'ng-rails-csrf'
])

angular.module('cafeTownsend.employee', [
  'ngRoute'
  'cafeTownsend.services'
])

angular.module('cafeTownsend', [
  'cafeTownsend.employee'
  'cafeTownsend.services'
])