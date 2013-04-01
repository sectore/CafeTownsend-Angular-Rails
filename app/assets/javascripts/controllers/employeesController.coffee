angular.module('cafeTownsend').controller 'EmployeesController'
, ['$log', '$scope', '$location', 'SessionService', 'EmployeesService', 'SelectedEmployee'
, ($log, $scope, $location, SessionService, EmployeesService, SelectedEmployee) ->


  # ########################
  # selected employee
  # ########################

  $scope.selectEmployee = (employee)->
    # storing selected employee (domain model)
    # and set a reference to scope
    SelectedEmployee.instance =
    $scope.selectedEmployee =
    employee

  # ########################
  # get
  # ########################
    
  getEmployees = ->
    $scope.employees = EmployeesService.query()

  # ########################
  # edit
  # ########################

  $scope.editEmployee = ->
    $location.path "/employees/#{$scope.selectedEmployee.id}/edit"

  # ########################
  # create
  # ########################

  $scope.createEmployee = ->
    $location.path "/employees/new"

  # ########################
  # delete
  # ########################

  $scope.deleteEmployee = ->
    employee = $scope.selectedEmployee
    if confirm("Are you sure you want to delete #{employee.first_name} #{employee.last_name}?")
      employee.$delete
        param:employee.id
        deleteResultHandler
        deleteErrorHandler

  deleteResultHandler = ->
    # clear reference to selected employee
    SelectedEmployee.instance =
    $scope.selectedEmployee =
    undefined
    # get employees again
    getEmployees()

  deleteErrorHandler = (error) ->
    alert "Error trying to delete an employee (error: #{error})"

  # ########################
  # init
  # ########################

  init = ->
    if !!SessionService.authorized()
      $scope.selectedEmployee = SelectedEmployee.instance
      getEmployees()
    else
      $location.path '/login'

  init()

]