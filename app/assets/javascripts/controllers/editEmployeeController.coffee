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
  '$location'
  '$routeParams'
  'SessionService'
  'EmployeesService'
  'SelectedEmployee'
  'ViewState'
  'ModalDialog'
  ($log, $window, $location, $routeParams, SessionService,
   EmployeesService, SelectedEmployee, ViewState, ModalDialog) ->

    self = @

    # init
    # ------------------------------------------------------------
    init = ->
      ViewState.current = 'edit'

      if !!SessionService.authorized()
        self.selectedEmployee = SelectedEmployee.instance
      else
        $location.path '/login'

    # update
    # ------------------------------------------------------------
    update = ->
      SelectedEmployee.instance.update(employee_id: SelectedEmployee.instance.id)
        .then ->
            self.browseToOverview()
          , (error) ->
            alert "Error trying to update an employee (error: #{error})"

    # delete
    # ------------------------------------------------------------
    @deleteEmployee = ->
      employee = SelectedEmployee.instance
      if ModalDialog.confirm("Are you sure you want to delete #{employee.firstName} #{employee.lastName}?")
        employee.delete(employee_id: employee.id)
          .then ->
            # clear reference to selected employee
            SelectedEmployee.instance = undefined
            # back to overview
            self.browseToOverview()
          , (error) ->
            alert "Error trying to delete an employee (error: #{error})"

    # form
    # ------------------------------------------------------------
    @submit = (validData)->
      if !!validData
        update()

    # navigation
    # ------------------------------------------------------------
    @browseToOverview = ->
      $location.path '/employees'

    # call init()
    # ------------------------------------------------------------
    init()

    # return a reference to controller itself
    # to avoid returning init(), which causes issues
    self
]