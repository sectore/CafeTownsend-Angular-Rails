angular.module('cafeTownsend.controllers').controller 'CreateEmployeeController'
, ['$log', '$scope', '$location', '$routeParams', 'SessionService', 'EmployeesService'
, ($log, $scope, $location, $routeParams, SessionService, EmployeesService) ->

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
    $location.path '/employees'

  # ########################
  # init
  # ########################

  init = ->
    if !!SessionService.authorized()
      $scope.selectedEmployee = EmployeesService.emptySelectedEmployee()
    else
      $location.path '/login'

  init()

]