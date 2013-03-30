angular.module 'cafeTownsend.services', ['ngResource']
angular.module 'cafeTownsend.controllers', []
angular.module('cafeTownsend', ['cafeTownsend.services', 'cafeTownsend.controllers']).config ["$httpProvider", (provider) ->
    provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr 'content'
]
