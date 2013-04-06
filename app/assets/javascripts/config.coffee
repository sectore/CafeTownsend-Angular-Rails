angular.module('cafeTownsend').config(['$httpProvider', ($httpProvider) ->
  $httpProvider.defaults.headers.common["X-Requested-With"] = 'XMLHttpRequest'
  $httpProvider.defaults.headers['common']['Accept'] = 'application/json'
])
