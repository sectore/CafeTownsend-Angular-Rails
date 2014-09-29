angular.module('cafeTownsend').controller 'MainController'
, [ '$log',
    'SessionService',
    'ViewState'
, ($log, SessionService, ViewState) ->

  self = @

  # init
  # ------------------------------------------------------------
  init = ->
    self.viewState = ViewState

  # user status
  # ------------------------------------------------------------
  @authorized = ->
    SessionService.authorized()

  init()

  self
]