angular.module('cafeTownsend').controller 'EmployeesController'
, ['$log', '$scope', '$location', 'SessionService', 'EmployeesService'
, ($log, $scope, $location, SessionService, EmployeesService) ->

  # ########################
  # select
  # ########################

  $scope.selectedEmployee = ->
    EmployeesService.getSelectedEmployee()

  $scope.selectEmployee = (employee)->
    EmployeesService.setSelectedEmployee(employee)

  # ########################
  # get all
  # ########################
    
  $scope.getEmployees = ->
    EmployeesService.getEmployees getEmployeesResultHandler, getEmployeesErrorHandler

  getEmployeesResultHandler = (result)->
    $scope.employees = result
    $scope.selectedEmployee()

  getEmployeesErrorHandler = (error) ->
    alert "Error: #{error}"

  # ########################
  # edit
  # ########################

  $scope.editEmployee = ->
    $location.path "/employees/#{EmployeesService.getSelectedEmployee().id}/edit"

  # ########################
  # create
  # ########################

  $scope.createEmployee = ->
    $location.path "/employees/new"

  # ########################
  # delete
  # ########################

  $scope.deleteEmployee = ->
    EmployeesService.deleteSelectedEmployee deleteResultHandler, deleteErrorHandler

  deleteResultHandler = ->
    EmployeesService.resetSelectedEmployee()
    $scope.getEmployees()

  deleteErrorHandler = (error) ->
    alert "Error trying to delete an employee (error: #{error})"

  # ########################
  # init
  # ########################

  init = ->
    if !!SessionService.authorized()
      $scope.getEmployees()
    else
      $location.path '/login'

  init()

]