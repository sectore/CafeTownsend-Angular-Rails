describe 'EditEmployeeController', ->

  beforeEach module('cafeTownsend')
  beforeEach module('test')

  beforeEach inject ($rootScope, $controller, MockFactory) ->

    @mockFactory = MockFactory
    @deferred = @mockFactory.deferred
    # routes
    @location = @mockFactory.location()
    @viewState = @mockFactory.viewState()
    @sessionService = @mockFactory.sessionService()
    @employeeResource = @mockFactory.employeeResource()
    # scope
    @scope = $rootScope.$new()
    # services
    @selectedEmployee = @mockFactory.selectedEmployee
    @modalDialog = @mockFactory.modalDialog()
    # controller factory
    @createController = ->
      $controller "EditEmployeeController",
        $scope: @scope
        $location: @location
        SessionService: @sessionService
        SelectedEmployee: @selectedEmployee
        ModalDialog: @modalDialog
        ViewState: @viewState

  afterEach ->

  it 'is injectable', ->
    controller = @createController()
    expect(controller).not.to.be(undefined)

  describe 'init()', ->
    it 'updates the view state', ->
      @createController()
      expect(@viewState.current).to.be('edit')

    it 'set isCreateForm to false', ->
      @createController()
      expect(@scope.isCreateForm).to.not.be.ok()

    it 'add selected employee to scope if an user is authorized', ->
      @selectedEmployee.instance = @employeeResource
      @sessionService.authorized.returns true
      @createController()
      expect(@scope.selectedEmployee).not.to.be(undefined)

    it 'have not an selected employee if an user is not authorized', ->
      @sessionService.authorized.returns false
      @createController()
      expect(@scope.selectedEmployee).to.be(undefined)

    it 'routes back to login page if an user is not authorized', ->
      @sessionService.authorized.returns false
      @createController()
      expect(@location.path.calledWith('/login')).to.be.ok()

  describe 'navigation', ->
    it 'updates the url calling browseToOverview() ', ->
      @createController()
      @scope.browseToOverview()
      expect(@location.path.calledWith('/employees')).to.be.ok()

  describe 'selectedEmployee', ->
    it 'is deleted', ->
      @modalDialog.confirm.returns true
      @selectedEmployee.instance = @employeeResource
      @createController()
      @scope.deleteEmployee()
      expect(@selectedEmployee.instance.delete.calledOnce).to.be.ok()

    it 'is updated submitting the form', ->
      @selectedEmployee.instance = @employeeResource
      @createController()
      @scope.submit()
      expect(@selectedEmployee.instance.update.calledOnce).to.be.ok()
