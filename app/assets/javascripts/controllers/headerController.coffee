angular.module('cafeTownsend').controller 'HeaderController'
, [ '$log',
    '$window',
    '$location',
    'SessionService'
, ($log, $window, $location, SessionService) ->

  # init
  # ------------------------------------------------------------

  self = @

  init = ->
    self.user = SessionService.getCurrentUser()

  # user status
  # ------------------------------------------------------------

  @authorized = ->
    SessionService.authorized()

  # logout
  # ------------------------------------------------------------
  @logout = ->
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

  self
]