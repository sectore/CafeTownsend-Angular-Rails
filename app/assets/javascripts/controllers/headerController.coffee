angular.module('cafeTownsend').controller 'HeaderController'
, [ '$log',
    '$window',
    '$scope',
    '$location',
    'SessionService'
, ($log, $window, $scope, $location, SessionService) ->

  # init
  # ------------------------------------------------------------

  init = ->
    $scope.user = SessionService.getCurrentUser()

  # user status
  # ------------------------------------------------------------

  $scope.authorized = ->
    SessionService.authorized()

  # logout
  # ------------------------------------------------------------
  $scope.logout = ->
      SessionService.logout()
      .then(
        logoutResultHandler()
      , (error)->
          logoutErrorHandler(error)
        )

  logoutResultHandler = ->
    # a successful log out
    # results in {"authorized":"false"}
    # sent from server side
    if !SessionService.authorized()
      $location.path '/login'

  logoutErrorHandler = (error) ->
    $window.alert "Error trying to log out (error: #{error})"


  init()
]