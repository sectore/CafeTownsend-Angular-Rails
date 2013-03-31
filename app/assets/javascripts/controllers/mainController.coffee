angular.module('cafeTownsend').controller 'MainController'
, ['$log', '$scope', 'SessionService'
, ($log, $scope, SessionService) ->

  # ########################
  # login status
  # ########################

  $scope.authorized = ->
    SessionService.authorized()

]