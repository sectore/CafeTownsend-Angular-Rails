# http://docs.angularjs.org/#!angular.service

# service Employees
# default set of resource actions are extended with custom actions:
#   update
#
# @see: http://docs.angularjs.org/#!/api/angular.service.$resource

angular.module('rails', []).factory 'railsresource', ($resource) ->
  (url, paramDefaults, actions) ->
    RAILS_DEFAULT =  {
      'show':    {method:'GET'},
      'create':   {method:'POST'},
      'index':  {method:'GET', isArray:true},
      'destroy': {method:'DELETE'}
      'update':  {method:'PUT'},
      'edit':    {method:'GET'},
      'new':    {method:'GET'}
    }
    rails_actions = extend({}, RAILS_DEFAULT, actions)
    $resource(url, paramDefaults, rails_actions)
  
services = angular.module('services', ['ngResource'])
services.service 'EmployeesService', ($resource) ->
	$resource(
		'employees/:employee_id',
		{},
		{}
	)


services.service 'SessionService', ($resource) ->
	$resource(
		'sessions/:user_id',
		{},
		{
			'login': {
				method: 'POST'
			}
			'logout': {
				method: 'DELETE'
			}
		}
	)