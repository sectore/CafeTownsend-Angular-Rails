angular.module('cafeTownsend').controller 'LoginController'
, ['$log', '$scope', '$location', 'SessionService', 'ViewState'
, ($log, $scope, $location, SessionService, ViewState) ->

  $scope.user = SessionService.getCurrentUser()
  # for debugging only
  $scope.user.name = "Luke"
  $scope.user.password = "Skywalker"

  ViewState.current = 'login'

  # ########################
  # login
  # ########################

  $scope.login = ->
    SessionService.login($scope.user)
      .then((result)->
        if !!SessionService.authorized()
          $location.path '/employees'
        else
          $scope.message = "Invalid username or password!"
      ,
      (error)->
        $scope.message = "Error: " + error
    )

  #helper method called by view to show or hide a message
  $scope.showMessage = (message) ->
    $scope.message? and $scope.message.length

]