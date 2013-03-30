angular.module('cafeTownsend').config ["$httpProvider", (provider) ->
  # set CSRF token by default for using Rails REST service
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr 'content'
]
