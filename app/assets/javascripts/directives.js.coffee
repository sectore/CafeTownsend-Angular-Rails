# http://docs.angularjs.org/#!/api/angular.directive

###
    Directive for listening double click events
    It's grabed and modified from directives of the "angular-todo-app"
    @see: https://github.com/cburgdorf/angular-todo-app/blob/master/app/js/directive.js
###
angular.directive 'ng:dblclick', (expression, compiledElement) ->
	compiler = @
	(linkElement) ->
		scope = @
		linkElement.bind "dblclick", (event) ->
			scope.$apply(expression, linkElement);
			event.stopPropagation()