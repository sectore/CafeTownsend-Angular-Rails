describe 'MainController', ->

  beforeEach module('cafeTownsend')
  beforeEach module('test')

  beforeEach inject ($rootScope, $controller, MockFactory) ->

    @mockFactory = MockFactory
    @viewState = @mockFactory.viewState()
    @sessionService = @mockFactory.sessionService()

    # controller factory
    @createController = ->
      $controller "MainController",
        SessionService: @sessionService
        ViewState: @viewState

  afterEach ->

  it 'is injectable', ->
    controller = @createController()
    expect(controller).not.to.be(undefined)

  describe 'init()', ->
    it 'stores an instance of ViewState', ->
      controller = @createController()
      expect(controller.viewState).to.be(@viewState)

  describe 'user status', ->
    it 'is stored', ->
      @sessionService.authorized.returns true
      controller = @createController()
      expect(controller.authorized()).to.be.ok()
      @sessionService.authorized.returns false
      expect(controller.authorized()).not.to.be.ok()
