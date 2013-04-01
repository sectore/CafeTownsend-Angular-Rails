angular.module('cafeTownsend').controller 'CreateEmployeeController'
, ['$log', '$scope', '$location', 'SessionService', 'EmployeesService', 'SelectedEmployee'
, ($log, $scope, $location, SessionService, EmployeesService, SelectedEmployee) ->

  $scope.isCreateForm = true

  # ########################
  # create
  # ########################

  create = ->
    employee = $scope.selectedEmployee
    employee.$save employee:employee, createResultHandler, saveErrorHandler

  createResultHandler = ->
    $scope.browseToOverview()

  saveErrorHandler = (error)->
    alert "Error trying to save a new employee (error: " + error + ")"

  # ########################
  # form
  # ########################

  $scope.submit = ->
    create()

  # ########################
  # navigation
  # ########################

  $scope.browseToOverview = ->
    # clear reference to selected employee
    SelectedEmployee.instance = undefined
    $location.path '/employees'

  # ########################
  # init
  # ########################

  init = ->
    if !!SessionService.authorized()
      employee = new EmployeesService()
      # for debugging only
#      employee.email = "info@websector.de"
#      employee.first_name = "jens"
#      employee.last_name = "krause"
#      employee.start_date = "2013-03-30"

      # store new created instance
      # set reference to scope
      SelectedEmployee.instance =
      $scope.selectedEmployee =
      employee
    else
      $location.path '/login'

  init()

]