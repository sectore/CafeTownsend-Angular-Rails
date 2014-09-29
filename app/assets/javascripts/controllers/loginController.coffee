angular.module('cafeTownsend')
.controller('LoginController', [
    '$log',
    '$location',
    'SessionService',
    'ViewState',
    ($log, $location, SessionService, ViewState) ->

      self = @

      # init
      # ------------------------------------------------------------
      init = ->
        self.user = SessionService.getCurrentUser()
        ViewState.current = 'login'
        # mock user data - for debugging only
        self.user.name = "Luke"
        self.user.password = "Skywalker"


      # login
      # ------------------------------------------------------------
      @submit = (validData)->
        if !!validData
          SessionService.login(self.user)
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
          self.loginError = 'Invalid username or password!'

      loginErrorHandler = (error) ->
        self.loginError = "Error: #{error}"


      # helper method called by view
      # to show or hide login error message
      @hasLoginError = ->
        self.loginError isnt undefined and self.loginError.length > 0

      init()

      # return a reference to controller itself
      # to avoid returning init(), which causes issues
      self
  ])
