angular.module('cafeTownsend').controller 'EmployeesController'
, [ '$log',
    '$window'
    '$location',
    'SessionService',
    'EmployeesService',
    'SelectedEmployee',
    'ViewState'
    'ModalDialog'
  , ($log, $window, $location, SessionService, EmployeesService, SelectedEmployee, ViewState, ModalDialog) ->

      # init
      # ------------------------------------------------------------
      self = @

      init = ->
        ViewState.current = 'employees'

        if !!SessionService.authorized()
          self.selectedEmployee = SelectedEmployee.instance
          getEmployees()
        else
          $location.path '/login'

      # selected employee
      # ------------------------------------------------------------
      @selectEmployee = (employee)->
        # storing selected employee (domain model)
        # and set a reference to it
        SelectedEmployee.instance =
          self.selectedEmployee =
            employee

      # get
      # ------------------------------------------------------------
      getEmployees = ->
        EmployeesService.query().then((employees) ->
          self.employees = employees
        , (error) ->
          $window.alert "Error trying to get employees (error: #{error})"
        )

      # edit
      # ------------------------------------------------------------
      @editEmployee = ->
        $location.path "/employees/#{self.selectedEmployee.id}/edit"

      # create
      # ------------------------------------------------------------
      @createEmployee = ->
        $location.path "/employees/new"

      # delete
      # ------------------------------------------------------------
      @deleteEmployee = ->
        employee = SelectedEmployee.instance
        if ModalDialog.confirm("Are you sure you want to delete #{employee.firstName} #{employee.lastName}?")
          employee.delete(employee_id: employee.id)
          .then ->
            # clear reference to selected employee
            SelectedEmployee.instance =
              self.selectedEmployee =
                undefined
            # get employees again
            getEmployees()
          , (error) ->
            $window.alert "Error trying to delete an employee (error: #{error})"

      init()

      # return a reference to controller itself
      # to avoid returning init(), which causes issues
      self

  ]