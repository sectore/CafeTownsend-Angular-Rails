angular.module('cafeTownsend').controller 'EmployeesController'
, [ '$log',
    '$window'
    '$scope',
    '$location',
    'SessionService',
    'EmployeesService',
    'SelectedEmployee',
    'ViewState'
    'ModalDialog'
, ( $log,
    $window,
    $scope,
    $location,
    SessionService,
    EmployeesService,
    SelectedEmployee,
    ViewState,
    ModalDialog) ->

  # init
  # ------------------------------------------------------------

  init = ->
    ViewState.current = 'employees'

    if !!SessionService.authorized()
      $scope.selectedEmployee = SelectedEmployee.instance
      getEmployees()
    else
      $location.path '/login'

  # selected employee
  # ------------------------------------------------------------
  $scope.selectEmployee = (employee)->
    # storing selected employee (domain model)
    # and set a reference to scope
    SelectedEmployee.instance =
    $scope.selectedEmployee =
    employee

  # get
  # ------------------------------------------------------------
  getEmployees = ->
    EmployeesService.query().then((employees) ->
      $scope.employees = employees
    , (error) ->
      $window.alert "Error trying to get employees (error: #{error})"
    )

  # edit
  # ------------------------------------------------------------
  $scope.editEmployee = ->
    $location.path "/employees/#{$scope.selectedEmployee.id}/edit"

  # create
  # ------------------------------------------------------------
  $scope.createEmployee = ->
    $location.path "/employees/new"

  # delete
  # ------------------------------------------------------------
  $scope.deleteEmployee = ->
    employee = SelectedEmployee.instance
    if ModalDialog.confirm("Are you sure you want to delete #{employee.firstName} #{employee.lastName}?")
      employee.delete(employee_id: employee.id)
        .then ->
          # clear reference to selected employee
          SelectedEmployee.instance =
          $scope.selectedEmployee =
          undefined
          # get employees again
          getEmployees()
        , (error) ->
          $window.alert "Error trying to delete an employee (error: #{error})"

  init()

]