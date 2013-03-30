# register all modules
angular.module 'cafeTownsend.services', ['ngResource']
angular.module 'cafeTownsend.controllers', []
angular.module 'cafeTownsend', ['cafeTownsend.services', 'cafeTownsend.controllers']
