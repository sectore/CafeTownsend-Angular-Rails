angular.module('cafeTownsend')
.controller 'LoginController'
, ['$log',
   '$scope',
   '$location',
   'SessionService',
   'ViewState'
, ($log, $scope, $location, SessionService, ViewState) ->

  # init
  # ------------------------------------------------------------
  init = ->
    $scope.user = SessionService.getCurrentUser()
    ViewState.current = 'login'
    # mock user data - for debugging only
    $scope.user.name = "Luke"
    $scope.user.password = "Skywalker"


  # login
  # ------------------------------------------------------------
  $scope.submit = ->
    SessionService.login($scope.user)
      .then((result)->
        loginResultHandler(result)
      ,
      (error)->
        loginErrorHandler(error)
    )

  loginResultHandler = (result) ->
    if !!SessionService.authorized()
      $location.path '/employees'
    else
      $scope.message = 'Invalid username or password!'

  loginErrorHandler = (error) ->
    $scope.message = "Error: #{error}"


  #helper method called by view
  # to show or hide a message
  $scope.showMessage = ->
    $scope.message isnt undefined and $scope.message.length > 0

  init()

]