angular.module('cafeTownsend').controller 'HeaderController'
, ['$log', '$scope', '$location', 'SessionService'
, ($log, $scope, $location, SessionService) ->

  $scope.user = SessionService.getCurrentUser()

  # login status
  # ------------------------------------------------------------

  $scope.authorized = ->
    SessionService.authorized()

  # logout
  # ------------------------------------------------------------

  $scope.logout = ->
    if !!SessionService.authorized()
      SessionService.logout()
        .then(
          # a successful log out results in {"authorized":"false"} sent from server side
          if !SessionService.authorized()
            $location.path '/login'
        ,
        (error)->
          alert "Error trying to log out (error: #{error})"
      )

]