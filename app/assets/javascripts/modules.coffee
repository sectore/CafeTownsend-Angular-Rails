# register all modules
angular.module 'cafeTownsend.services', ['ngResource', 'rails', 'ng-rails-csrf']
angular.module('cafeTownsend', ['cafeTownsend.services']).config(['$httpProvider', ($httpProvider) ->
#  authToken = $('meta[name="csrf-token"]').attr('content');
#  $httpProvider.defaults.headers.common['X-CSRF-TOKEN'] = authToken;
  $httpProvider.defaults.headers.common["X-Requested-With"] = 'XMLHttpRequest'
  $httpProvider.defaults.headers['common']['Accept'] = 'application/json'
])
