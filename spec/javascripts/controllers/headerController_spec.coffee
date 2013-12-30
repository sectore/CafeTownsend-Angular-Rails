describe 'HeaderController', ->

  beforeEach module('cafeTownsend')

  beforeEach inject ($q, $rootScope, $controller, $location) ->
    # routes
    @location = $location
    # scope
    @scope = $rootScope.$new()
    # mocking service
    @deferred = $q.defer();
    @promise = @deferred.promise
    @mockSessionService =
      login: =>
        @promise
      logout: =>
        @promise
      getCurrentUser: ->
        {}
      authorized: ->
        true

    # controller factory
    @createController = ->
      controller = $controller "HeaderController",
        $scope: @scope
        $location: @location
        SessionService: @mockSessionService

  afterEach ->
    @location =
    @mockSessionService =
    @scope =
    undefined

  it 'is injectable', ->
    controller = @createController()
    expect(controller).not.to.be(undefined)

  describe 'initialize()', ->
    it 'stores currentUser to scope', ->
      @createController()
      expect(@scope.user).not.to.be(undefined)

  describe 'logout()', ->

    it 'calls service to logout an user', ->
      spy = sinon.spy(@mockSessionService, 'logout')
      @createController()
      @scope.logout()
      expect(spy.calledOnce).to.be.ok()
      spy.restore()

    it 'updates location.path if the user was logged out successfully', inject(($rootScope)->
      stub = sinon.stub(@mockSessionService, 'authorized').returns false
      @createController()
      @scope.logout()
      @deferred.resolve()
      expect(@location.path()).to.be('/login')
      stub.restore()
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