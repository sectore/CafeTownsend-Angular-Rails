# defining all routes
angular.module('cafeTownsend').config [
  '$routeProvider'
  '$locationProvider'
  ($routeProvider, $locationProvider) ->
    $routeProvider
    .when '/login',
      templateUrl: '/assets/login.html',
      controller: 'LoginController'
      controllerAs: 'loginCtrl'

    .when '/employees',
      templateUrl: '/assets/employees.html'
      controller: 'EmployeesController'
      controllerAs: 'employeesCtrl'

    .when '/employees/new',
      templateUrl: '/assets/employee-create.html'
      controller: 'CreateEmployeeController'
      controllerAs: 'createEmployeeCtrl'

    .when '/employees/:id/edit',
      templateUrl: '/assets/employee-edit.html'
      controller: 'EditEmployeeController'
      controllerAs: 'editEmployeeCtrl'

    .otherwise
      redirectTo: '/login'

    # enabling html5Mode
    $locationProvider.html5Mode true
]