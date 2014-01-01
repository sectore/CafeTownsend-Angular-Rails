describe 'LoginController', ->

  beforeEach module('cafeTownsend')
  beforeEach module('test')

  beforeEach inject ($rootScope, $controller, MockFactory) ->

    @mockFactory = MockFactory
    @deferred = @mockFactory.deferred
    # routes
    @location = @mockFactory.location()
    # scope
    @scope = $rootScope.$new()
    # mocking service
    @sessionService = @mockFactory.sessionService()
    @viewState = @mockFactory.viewState()

    # controller factory
    @createController = ->
      controller = $controller "LoginController",
        $scope: @scope
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

    it 'stores currentUser to scope', ->
      @createController()
      expect(@scope.user).not.to.be(undefined)

  describe 'submit()', ->

    it 'calls service with user data to login', ->
      @scope.user =
        name: 'joe'
        password: 'secret'
      @createController()
      @scope.submit()
      expect(@sessionService.login.calledWithExactly(@scope.user)).to.be.ok()

    it 'updates location.path if the login was successfully', inject(($rootScope)->
      @sessionService.authorized.returns true
      @createController()
      @deferred.resolve()
      @scope.submit()
      $rootScope.$apply()
      expect(@location.path.calledWith('/employees')).to.be.ok()
    )

    it 'shows an error message if the login was NOT successfully', inject(($rootScope)->
      @sessionService.authorized.returns false
      @createController()
      @deferred.resolve()
      @scope.submit()
      $rootScope.$apply()
      expect(@scope.message).to.be('Invalid username or password!')
    )

    it 'shows an error message if the login throws an error', inject(($rootScope)->
      @createController()
      @deferred.reject()
      @scope.submit()
      $rootScope.$apply()
      expect(@scope.message).to.be.ok()
    )


  describe 'showMessage()', ->
    it 'hides the message by default', ->
      @createController()
      expect(@scope.showMessage()).not.to.be.ok()

    it 'shows the message if the message is available', ->
      @scope.message = 'hello world'
      @createController()
      expect(@scope.showMessage()).to.be.ok()