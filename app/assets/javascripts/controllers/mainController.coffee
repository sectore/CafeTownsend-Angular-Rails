angular.module('cafeTownsend').controller 'MainController'
, ['$log', '$scope', 'SessionService', 'ViewState'
, ($log, $scope, SessionService, ViewState) ->

  $scope.viewState = ViewState

  # ########################
  # login status
  # ########################

  $scope.authorized = ->
    SessionService.authorized()


]