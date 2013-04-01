###
  Simple Service to share data of selected employee beetween controllers.
  It is acting as a domain model.
###
angular.module('cafeTownsend.services').factory 'SelectedEmployee'
, ['$log', '$resource'
, ($log, $resource) ->

  # @return instance of selected employee,
  # which is an instance of EmployeeService.
  # It is undefined by default.
  instance: undefined

]