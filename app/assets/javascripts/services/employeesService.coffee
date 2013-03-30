angular.module('cafeTownsend.services').factory 'EmployeesService', ['$log', '$resource', ($log, $resource) ->

  selectedEmployee = null

  Employees = $resource '/employees/:param', {},
    'update':
      method: 'PUT'

  getEmployees = (resultHandler, errorHandler) ->
    Employees.query (result) ->
      employees = result
      resultHandler(employees) if angular.isFunction resultHandler
    , (error) ->
      errorHandler(error) if angular.isFunction errorHandler

  getEmployeeById = (id, resultHandler, errorHandler) ->
    Employees.get param:id
    , (result) ->
      selectedEmployee = result
      resultHandler(selectedEmployee) if angular.isFunction resultHandler
    , (error) ->
      errorHandler(error) if angular.isFunction errorHandler

  deleteSelectedEmployee = (resultHandler, errorHandler) ->
    $log.info "deleteSelectedEmployee -> selectedEmployee #{selectedEmployee}"
    if confirm("Are you sure you want to delete #{selectedEmployee.first_name} #{selectedEmployee.last_name}?")
      selectedEmployee.$delete param:selectedEmployee.id
      , () ->
        resetSelectedEmployee()
        resultHandler() if angular.isFunction resultHandler
      , (error) ->
        errorHandler(error) if angular.isFunction errorHandler

  setSelectedEmployee = (employee) ->
    selectedEmployee = employee

  getSelectedEmployee = ->
    selectedEmployee

  resetSelectedEmployee = ->
    selectedEmployee = undefined

  emptySelectedEmployee = ->
    employee = new Employees()
    # for debugging only
#    employee.email = "info@websector.de"
#    employee.first_name = "jens"
#    employee.last_name = "krause"
#    employee.start_date = "2013-03-30"
    selectedEmployee = employee


  {
    getEmployees,
    getEmployeeById,
    deleteSelectedEmployee,
    getSelectedEmployee,
    setSelectedEmployee,
    resetSelectedEmployee,
    emptySelectedEmployee
  }
]