angular.module('cafeTownsend').controller 'EmployeesController'
, ['$log', '$scope', '$location', 'SessionService', 'EmployeesService', 'SelectedEmployee', 'ViewState'
, ($log, $scope, $location, SessionService, EmployeesService, SelectedEmployee, ViewState) ->


  ViewState.current = 'employees'

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
    EmployeesService.query().then (employees) ->

      $scope.employees = employees

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
    employee = SelectedEmployee.instance
    if confirm("Are you sure you want to delete #{employee.firstName} #{employee.lastName}?")
      employee.delete(employee_id: employee.id)
        .then ->
          # clear reference to selected employee
          SelectedEmployee.instance =
          $scope.selectedEmployee =
          undefined
          # get employees again
          getEmployees()
        , (error) ->
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