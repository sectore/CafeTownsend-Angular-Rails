describe 'MainController', ->

  beforeEach module('cafeTownsend')

  beforeEach inject ($rootScope, $controller, ViewState) ->
    # scope
    @scope = $rootScope.$new()

    # controller factory
    @createController = ->
      $controller "MainController",
        $scope: @scope
        ViewState: ViewState

  afterEach ->
    @scope =
    undefined

  it 'is injectable', ->
    controller = @createController()
    expect(controller).not.to.be(undefined)

  describe 'init()', ->
    it 'stores instance of ViewState to scope', inject((ViewState)->
      @createController()
      expect(@scope.viewState).to.be(ViewState)
    )

  describe 'user status', ->
    it 'stores status into a scope object', inject((SessionService)->
      stub = sinon.stub(SessionService, 'authorized')
      stub.returns true
      @createController()
      expect(@scope.authorized()).to.be.ok()
      stub.restore()
      stub.returns false
      expect(@scope.authorized()).not.to.be.ok()
      stub.restore()
    )
