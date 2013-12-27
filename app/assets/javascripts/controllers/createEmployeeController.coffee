angular.module('cafeTownsend.employee')

.config([
  '$routeProvider',
  ($routeProvider) ->
    $routeProvider
    .when '/employees/new',
        templateUrl: '/assets/employee.html'
        controller: 'CreateEmployeeController'
])

.controller 'CreateEmployeeController', [
  '$log'
  '$scope'
  '$location'
  'SessionService'
  'EmployeesService'
  'SelectedEmployee'
  'ViewState'
  ($log, $scope, $location, SessionService, EmployeesService, SelectedEmployee, ViewState) ->

    # init
    # ------------------------------------------------------------

    init = ->
      $scope.isCreateForm = true
      ViewState.current = 'create'

      if !!SessionService.authorized()
        employee = new EmployeesService()
        # for debugging only
  #      employee.email = "jk@websector.de"
  #      employee.firstName = "j"
  #      employee.lastName = "k"
  #      employee.startDate = "2013-10-06"

        # store new created instance
        # set reference to scope
        SelectedEmployee.instance =
        $scope.selectedEmployee =
        employee
      else
        $location.path '/login'

    # scope
    # ------------------------------------------------------------

    $scope.submit = ->
      #      employee = $scope.selectedEmployee
      SelectedEmployee.instance.create()
      .then ->
          $scope.browseToOverview()
        , (error) ->
          message = "Error trying to create a new employee: #{JSON.stringify(error.data)})"
          alert message

    $scope.browseToOverview = ->
      # clear selected employee
      SelectedEmployee.instance = undefined
      $location.path '/employees'

    # call init()
    # ------------------------------------------------------------
    init()

]