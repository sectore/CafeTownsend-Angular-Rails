describe 'LoginController', ->

  beforeEach module('cafeTownsend')
  beforeEach module('test')

  beforeEach inject ($rootScope, $controller, MockFactory) ->

    @mockFactory = MockFactory
    @deferred = @mockFactory.deferred
    # routes
    @location = @mockFactory.location()
    # mocking service
    @sessionService = @mockFactory.sessionService()
    @viewState = @mockFactory.viewState()

    # controller factory
    @createController = ->
      $controller "LoginController",
        $location: @location
        SessionService: @sessionService
        ViewState: @viewState



  afterEach ->


  it 'is injectable', ->
    controller = @createController()
    expect(controller).not.to.be(undefined)

  describe 'initialize()', ->
    it 'updates the view state', inject((ViewState) ->
      @createController()
      expect(ViewState.current).to.be('login')
    )

    it 'stores currentUser', ->
      controller = @createController()
      expect(controller.user).not.to.be(undefined)

  describe 'submit()', ->

    it 'calls service with user data to login', ->
      controller = @createController()
      controller.user =
        name: 'joe'
        password: 'secret'

      controller.submit(true)
      expect(@sessionService.login.calledWithExactly(controller.user)).to.be.ok()

    it 'updates location.path if the login was successfully',  inject(($rootScope)->
      @sessionService.authorized.returns true
      controller = @createController()
      @deferred.resolve()
      controller.submit(true)
      # Propagate promise resolution to 'then' functions using $apply().
      # @see: https://docs.angularjs.org/api/ng/service/$q
      $rootScope.$apply()
      expect(@location.path.calledWith('/employees')).to.be.ok()
    )

    it 'shows an error message if the login was NOT successfully', inject(($rootScope)->
      @sessionService.authorized.returns false
      controller = @createController()
      @deferred.resolve()
      controller.submit(true)
      $rootScope.$apply()
      expect(controller.loginError).to.be('Invalid username or password!')
    )

    it 'shows an error message if the login throws an error', inject(($rootScope)->
      controller = @createController()
      @deferred.reject()
      controller.submit(true)
      $rootScope.$apply()
      expect(controller.loginError).to.be.ok()
    )

  describe 'hasLoginError()', ->
    it 'hides the message by default', ->
      controller = @createController()
      expect(controller.hasLoginError()).not.to.be.ok()

    it 'shows the message if the message is available', ->
      controller = @createController()
      controller.loginError = 'hello world'
      expect(controller.hasLoginError()).to.be.ok()