angular.module('cafeTownsend.employee')

.config([
  '$routeProvider',
  ($routeProvider) ->
    $routeProvider
    .when '/employees/:id/edit',
      templateUrl: '/assets/employee.html'
      controller: 'EditEmployeeController'
])

.controller 'EditEmployeeController', [
  '$log'
  '$window'
  '$scope'
  '$location'
  '$routeParams'
  'SessionService'
  'EmployeesService'
  'SelectedEmployee'
  'ViewState'
  'ModalDialog'
  ($log, $window, $scope, $location, $routeParams, SessionService,
   EmployeesService, SelectedEmployee, ViewState, ModalDialog) ->
    # init
    # ------------------------------------------------------------
    init = ->
      $scope.isCreateForm = false
      ViewState.current = 'edit'

      if !!SessionService.authorized()
        $scope.selectedEmployee = SelectedEmployee.instance
      else
        $location.path '/login'

    # update
    # ------------------------------------------------------------
    update = ->
      SelectedEmployee.instance.update(employee_id: SelectedEmployee.instance.id)
        .then ->
            $scope.browseToOverview()
          , (error) ->
            alert "Error trying to update an employee (error: #{error})"

    # delete
    # ------------------------------------------------------------
    $scope.deleteEmployee = ->
      employee = SelectedEmployee.instance
      if ModalDialog.confirm("Are you sure you want to delete #{employee.firstName} #{employee.lastName}?")
        employee.delete(employee_id: employee.id)
          .then ->
            # clear reference to selected employee
            SelectedEmployee.instance = undefined
            # back to overview
            $scope.browseToOverview()
          , (error) ->
            alert "Error trying to delete an employee (error: #{error})"

    # form
    # ------------------------------------------------------------
    $scope.submit = ->
      update()

    # navigation
    # ------------------------------------------------------------
    $scope.browseToOverview = ->
      $location.path '/employees'

    # call init()
    # ------------------------------------------------------------
    init()
]