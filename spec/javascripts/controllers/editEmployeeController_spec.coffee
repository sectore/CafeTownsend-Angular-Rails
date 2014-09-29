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
    # services
    @selectedEmployee = @mockFactory.selectedEmployee
    @modalDialog = @mockFactory.modalDialog()
    # controller factory
    @createController = ->
      $controller "EditEmployeeController",
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

    it 'has a selected employee if an user is authorized', ->
      @selectedEmployee.instance = @mockFactory.employeeResource()
      @sessionService.authorized.returns true
      controller = @createController()
      expect(controller.selectedEmployee).not.to.be(undefined)

    it 'have not an selected employee if an user is not authorized', ->
      @sessionService.authorized.returns false
      controller = @createController()
      expect(controller.selectedEmployee).to.be(undefined)

    it 'routes back to login page if an user is not authorized', ->
      @sessionService.authorized.returns false
      @createController()
      expect(@location.path.calledWith('/login')).to.be.ok()

  describe 'navigation', ->
    it 'updates the url calling browseToOverview() ', ->
      controller = @createController()
      controller.browseToOverview()
      expect(@location.path.calledWith('/employees')).to.be.ok()

  describe 'selectedEmployee', ->
    it 'is deleted', ->
      @modalDialog.confirm.returns true
      @selectedEmployee.instance = @employeeResource
      controller = @createController()
      controller.deleteEmployee()
      expect(@selectedEmployee.instance.delete.calledOnce).to.be.ok()

    it 'is updated submitting the form', ->
      @selectedEmployee.instance = @employeeResource
      controller = @createController()
      controller.submit(true)
      expect(@selectedEmployee.instance.update.calledOnce).to.be.ok()
