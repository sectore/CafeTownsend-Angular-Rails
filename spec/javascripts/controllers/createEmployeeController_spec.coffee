describe 'CreateEmployeeController', ->

  beforeEach module('cafeTownsend')
  beforeEach module('test')

  beforeEach inject ($rootScope, $controller, MockFactory) ->

    @mockFactory = MockFactory
    @deferred = @mockFactory.deferred

    @location = @mockFactory.location()
    @sessionService = @mockFactory.sessionService()
    @selectedEmployee = @mockFactory.selectedEmployee()
    @viewState = @mockFactory.viewState()

    @scope = $rootScope.$new()

    # controller factory
    @createController = ->
      $controller "CreateEmployeeController",
        $location: @location
        SessionService: @sessionService
        SelectedEmployee: @selectedEmployee
        ViewState: @viewState

  afterEach ->


  it 'is injectable', ->
    controller = @createController()
    expect(controller).not.to.be(undefined)

  describe 'initialize()', ->
    it 'updates the view state', ->
      @createController()
      expect(@viewState.current).to.be('create')

    it 'routes back to login page if an user is not authorized', ->
      @sessionService.authorized.returns false
      @createController()
      expect(@location.path.calledWith('/login')).to.be.ok()

    it 'creates a selected employee if an user is authorized', ->
      @sessionService.authorized.returns true
      @createController()
      expect(@selectedEmployee.instance).not.to.be(undefined)

  describe 'public methods: ', ->
    it 'browseToOverview() updates the url', ->
      controller = @createController()
      controller.browseToOverview()
      expect(@location.path.calledWith('/employees')).to.be.ok()

    it 'browseToOverview() disposes the selected employee', ->
      controller = @createController()
      controller.browseToOverview()
      expect(@selectedEmployee.instance).to.be(undefined)

    it 'submit() creates an employee', ->
      @sessionService.authorized.returns true
      controller = @createController()
      spy = sinon.spy(@selectedEmployee.instance, 'create')
      controller.submit(true)
      expect(spy.calledOnce).to.be.ok()
      spy.restore()
