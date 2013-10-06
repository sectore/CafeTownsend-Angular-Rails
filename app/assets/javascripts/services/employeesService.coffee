###
  RESTful service to handle data of employees
  using angularjs-rails-resource
  @see: http://ngmodules.org/modules/angularjs-rails-resource
###
angular.module('cafeTownsend.services').factory('EmployeesService', [
  '$log'
  'railsResourceFactory'
  ($log, railsResourceFactory) ->
    resource = railsResourceFactory
      url: '/employees'
      name: 'employee'
])