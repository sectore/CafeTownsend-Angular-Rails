angular.module('cafeTownsend').controller 'MainController'
, [ '$log',
    '$scope',
    'SessionService',
    'ViewState'
, ($log, $scope, SessionService, ViewState) ->

  # init
  # ------------------------------------------------------------
  init = ->
    $scope.viewState = ViewState

  # user status
  # ------------------------------------------------------------
  $scope.authorized = ->
    SessionService.authorized()

  init()
]