angular.module('cafeTownsend').controller 'HeaderController'
, ['$log', '$scope', '$location', 'SessionService'
, ($log, $scope, $location, SessionService) ->

  $scope.user = SessionService.getUser()

  # ########################
  # login status
  # ########################

  $scope.authorized = ->
    SessionService.authorized()

  # ########################
  # logout
  # ########################

  $scope.logout = ->
    if !!SessionService.authorized()
      SessionService.logout logoutResultHandler, logoutErrorHandler

  logoutResultHandler = ->
    # a succesfull log out results in {"authorized":"false"} sent from server side
    if !SessionService.authorized()
      $location.path '/login'

  logoutErrorHandler = (error)->
    alert "Error trying to log out (error: #{error})"

]