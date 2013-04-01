###
  RESTful service to handle data of employees
###
angular.module('cafeTownsend.services').factory 'EmployeesService'
, ['$log', '$resource'
, ($log, $resource) ->

  Employees = $resource '/employees/:param', {},
    'update':
      method: 'PUT'

  Employees
]