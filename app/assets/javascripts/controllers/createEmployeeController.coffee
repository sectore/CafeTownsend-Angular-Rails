angular.module('cafeTownsend.employee')

.controller 'CreateEmployeeController', [
  '$log'
  '$location'
  'SessionService'
  'EmployeesService'
  'SelectedEmployee'
  'ViewState'
  ($log, $location, SessionService, EmployeesService, SelectedEmployee, ViewState) ->

    self = this

    # init
    # ------------------------------------------------------------

    init = ->
      ViewState.current = 'create'

      if !!SessionService.authorized()
        employee = new EmployeesService()
        # for debugging only
#        employee.email = "jk@websector.de"
#        employee.firstName = "j"
#        employee.lastName = "k"
#        employee.startDate = "2013-10-06"

        # store new created instance
        # set reference to selectedEmployee
        SelectedEmployee.instance =
        self.selectedEmployee =
        employee
      else
        $location.path '/login'

    @submit = (validData)->
      if !!validData
        SelectedEmployee.instance.create()
        .then ->
            self.browseToOverview()
          , (error) ->
            message = "Error trying to create a new employee: #{JSON.stringify(error.data)})"
            alert message

    @browseToOverview = ->
      # clear selected employee
      SelectedEmployee.instance = undefined
      $location.path '/employees'

    # call init()
    # ------------------------------------------------------------
    init()

    # return a reference to controller itself
    # to avoid returning init(), which causes issues
    self

]