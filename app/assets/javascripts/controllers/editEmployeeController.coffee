angular.module('cafeTownsend').controller 'EditEmployeeController'
, ['$log', '$scope', '$location', '$routeParams', 'SessionService', 'EmployeesService'
, ($log, $scope, $location, $routeParams, SessionService, EmployeesService) ->

  $scope.isCreateForm = false

  # ########################
  # get
  # ########################

  getEmployee = ->
    EmployeesService.getEmployeeById $routeParams.id, getEmployeeResultHandler, getEmployeeErrorHandler

  getEmployeeResultHandler = (employee) ->
    $scope.selectedEmployee = employee

  getEmployeeErrorHandler = (error) ->
    alert "Error to get data of an employee (error: #{error})"

  # ########################
  # update
  # ########################

  update = ->
    employee = $scope.selectedEmployee
    employee.$update param:employee.id, updateResultHandler, updateErrorHandler

  updateResultHandler = ->
    $scope.browseToOverview()

  updateErrorHandler = (error) ->
    alert "Error trying to update an employee (error: #{error})"

  # ########################
  # delete
  # ########################

  $scope.deleteEmployee = ->
    EmployeesService.deleteSelectedEmployee deleteResultHandler, deleteErrorHandler

  deleteResultHandler = ->
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
    if !!SessionService.authorized()
      getEmployee()
    else
      $location.path '/login'

  init()
]