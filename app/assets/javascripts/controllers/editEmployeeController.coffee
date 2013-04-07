angular.module('cafeTownsend').controller 'EditEmployeeController'
, ['$log', '$scope', '$location', '$routeParams', 'SessionService', 'EmployeesService', 'SelectedEmployee', 'ViewState'
, ($log, $scope, $location, $routeParams, SessionService, EmployeesService, SelectedEmployee, ViewState) ->

  $scope.isCreateForm = false

  ViewState.current = 'edit'

  # ########################
  # update
  # ########################

  update = ->
    SelectedEmployee.instance.update(employee_id: SelectedEmployee.instance.id)
      .then ->
          $scope.browseToOverview()
        , (error) ->
          alert "Error trying to update an employee (error: #{error})"


  # ########################
  # delete
  # ########################

  $scope.deleteEmployee = ->
    employee = SelectedEmployee.instance
    if confirm("Are you sure you want to delete #{employee.firstName} #{employee.lastName}?")
      employee.delete(employee_id: employee.id)
        .then ->
          # clear reference to selected employee
          SelectedEmployee.instance = undefined
          # back to overview
          $scope.browseToOverview()
        , (error) ->
          alert "Error trying to delete an employee (error: #{error})"

  # ########################
  # form
  # ########################

  $scope.submit = ->
    update()

  # ########################
  # navigation
  # ########################

  $scope.browseToOverview = ->
    $location.path '/employees'

  # ########################
  # init
  # ########################

  init = ->
    unless SessionService.authorized()
      $location.path '/login'
    else
      $scope.selectedEmployee = SelectedEmployee.instance

  init()
]