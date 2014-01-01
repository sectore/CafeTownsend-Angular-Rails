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
        $scope: @scope
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

    it 'set isCreateForm to true', ->
      @createController()
      expect(@scope.isCreateForm).to.be.ok()

    it 'routes back to login page if an user is not authorized', ->
      @sessionService.authorized.returns false
      @createController()
      expect(@location.path.calledWith('/login')).to.be.ok()

    it 'creates a selected employee if an user is authorized', ->
      @sessionService.authorized.returns true
      @createController()
      expect(@selectedEmployee.instance).not.to.be(undefined)

    it 'adds the selected employee to scope if an user is authorized', ->
      @sessionService.authorized.returns true
      @createController()
      expect(@scope.selectedEmployee).not.to.be(undefined)

  describe 'scope', ->
    it 'browseToOverview() updates the url', ->
      @createController()
      @scope.browseToOverview()
      expect(@location.path.calledWith('/employees')).to.be.ok()

    it 'browseToOverview() disposes the selected employee', ->
      @createController()
      @scope.browseToOverview()
      expect(@selectedEmployee.instance).to.be(undefined)

    it 'submit() creates an employee', ->
      @sessionService.authorized.returns true
      @createController()
      spy = sinon.spy(@selectedEmployee.instance, 'create')
      @scope.submit()
      expect(spy.calledOnce).to.be.ok()
      spy.restore()
