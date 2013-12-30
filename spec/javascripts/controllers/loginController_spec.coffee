describe 'LoginController', ->

  beforeEach module('cafeTownsend')

  beforeEach inject ($q, $rootScope, $controller, $location, ViewState) ->
    # routes
    @location = $location
    # scope
    @scope = $rootScope.$new()
    # mocking service
    @deferred = $q.defer()
    @promise = @deferred.promise
    @mockSessionService =
      login: =>
        @promise
      getCurrentUser: ->
        {}
      authorized: ->
        true

    # controller factory
    @createController = ->
      controller = $controller "LoginController",
        $scope: @scope
        $location: @location
        SessionService: @mockSessionService
        ViewState: ViewState



  afterEach ->
    @scope = undefined

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
      spy = sinon.spy(@mockSessionService, 'login')
      @createController()
      @scope.submit()
      expect(spy.calledWithExactly(@scope.user)).to.be.ok()
      spy.restore()

    it 'updates location.path if the login was successfully', inject(($rootScope)->
      @createController()
      @deferred.resolve()
      @scope.submit()
      $rootScope.$apply()
      expect(@location.path()).to.equal('/employees')
    )

    it 'shows an error message if the login was NOT successfully', inject(($rootScope)->
      stub = sinon.stub(@mockSessionService, 'authorized').returns false
      @createController()
      @deferred.resolve()
      @scope.submit()
      $rootScope.$apply()
      expect(@scope.message).to.be('Invalid username or password!')
      stub.restore()
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