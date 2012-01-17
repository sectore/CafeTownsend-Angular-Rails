# http://docs.angularjs.org/#!angular.service

# service Employees
# default set of resource actions are extended with custom actions:
#   update
#
# @see: http://docs.angularjs.org/#!/api/angular.service.$resource
angular.service 'EmployeesService', ($resource) ->
	$resource(
		'employees/:employee_id',
		{},
		{
			'update': {
					method: 'PUT'
				}
		}
	)


angular.service 'SessionService', ($resource) ->
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