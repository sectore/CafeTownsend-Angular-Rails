angular.module('cafeTownsend').controller 'CreateEmployeeController'
, ['$log', '$scope', '$location', 'SessionService', 'EmployeesService', 'SelectedEmployee'
, ($log, $scope, $location, SessionService, EmployeesService, SelectedEmployee) ->

  $scope.isCreateForm = true

  # ########################
  # create
  # ########################

  create = ->
    employee = $scope.selectedEmployee
    employee.create()
      .then ->
        $scope.browseToOverview()
      , (error) ->
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
#      employee.firstName = "jens"
#      employee.lastName = "krause"
#      employee.startDate = "2013-03-30"

      # store new created instance
      # set reference to scope
      SelectedEmployee.instance =
      $scope.selectedEmployee =
      employee
    else
      $location.path '/login'

  init()

]