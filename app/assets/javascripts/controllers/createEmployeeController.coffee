angular.module('cafeTownsend').controller 'CreateEmployeeController'
, ['$log', '$scope', '$location', 'SessionService', 'EmployeesService', 'SelectedEmployee', 'ViewState'
, ($log, $scope, $location, SessionService, EmployeesService, SelectedEmployee, ViewState) ->

  $scope.isCreateForm = true

  ViewState.current = 'create'

  # ########################
  # create
  # ########################

  create = ->
    employee = $scope.selectedEmployee
    employee.create()
      .then ->
        $scope.browseToOverview()
      , (error) ->
        message = "Error trying to create a new employee: #{JSON.stringify(error.data.errors)})"
        alert message

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