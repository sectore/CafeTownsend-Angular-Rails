describe 'HeaderController', ->

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
    @deferred = @mockFactory.deferred;
    @sessionService = @mockFactory.sessionService()

    # controller factory
    @createController = ->
      $controller "HeaderController",
        $scope: @scope
        $location: @location
        SessionService: @sessionService

  afterEach ->

  it 'is injectable', ->
    controller = @createController()
    expect(controller).not.to.be(undefined)

  describe 'initialize()', ->
    it 'stores currentUser to scope', ->
      @createController()
      expect(@scope.user).not.to.be(undefined)

  describe 'logout()', ->

    it 'calls service to logout an user', ->
      @createController()
      @scope.logout()
      expect(@sessionService.logout.calledOnce).to.be.ok()

    it 'updates location.path if the user was logged out successfully', inject(($rootScope)->
      @sessionService.authorized.returns false
      @createController()
      @scope.logout()
      @deferred.resolve()
      expect(@location.path.calledWith('/login')).to.be.ok()
    )

    it 'alert an error message if the logout process throws an error', inject(($rootScope, $window)->
      @createController()
      spy = sinon.spy($window, 'alert')
      @deferred.reject()
      @scope.logout()
      $rootScope.$apply()
      expect(spy.calledOnce).to.be.ok()
      spy.restore()
    )