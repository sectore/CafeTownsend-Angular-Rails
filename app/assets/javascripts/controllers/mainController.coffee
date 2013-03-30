angular.module('cafeTownsend.controllers').controller 'MainController'
, ['$log', '$scope', 'SessionService', ($log, $scope, SessionService) ->

  # ########################
  # login status
  # ########################

  $scope.authorized = ->
    SessionService.authorized()

]