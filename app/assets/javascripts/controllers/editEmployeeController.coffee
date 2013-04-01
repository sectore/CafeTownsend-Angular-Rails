angular.module('cafeTownsend').controller 'EditEmployeeController'
, ['$log', '$scope', '$location', '$routeParams', 'SessionService', 'EmployeesService', 'SelectedEmployee'
, ($log, $scope, $location, $routeParams, SessionService, EmployeesService, SelectedEmployee) ->

  $scope.isCreateForm = false

  # ########################
  # update
  # ########################

  update = ->
    SelectedEmployee.instance.$update
      param: SelectedEmployee.instance.id
      updateResultHandler
      updateErrorHandler

  updateResultHandler = (result) ->
    $scope.browseToOverview()

  updateErrorHandler = (error) ->
    alert "Error trying to update an employee (error: #{error})"

  # ########################
  # delete
  # ########################

  $scope.deleteEmployee = ->
    employee = SelectedEmployee.instance
    if confirm("Are you sure you want to delete #{employee.first_name} #{employee.last_name}?")
      employee.$delete
        param:employee.id
        deleteResultHandler
        deleteErrorHandler

  deleteResultHandler = ->
    # clear reference to selected employee
    SelectedEmployee.instance = undefined
    # back to overview
    $scope.browseToOverview()

  deleteErrorHandler = (error) ->
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