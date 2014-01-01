describe 'EmployeesController', ->

  beforeEach module('cafeTownsend')
  beforeEach module('test')

  beforeEach inject ($rootScope, $controller, MockFactory) ->

    @mockFactory = MockFactory
    @deferred = @mockFactory.deferred

    # routes
    @location = @mockFactory.location()
    # scope
    @scope = $rootScope.$new()
    # services
    @employeesService = @mockFactory.employeesService()
    @selectedEmployee = @mockFactory.selectedEmployee()
    @employeeResource = @mockFactory.employeeResource()
    @sessionService = @mockFactory.sessionService()
    @viewState = @mockFactory.viewState()
    @modalDialog = @mockFactory.modalDialog()

    # controller factory
    @createController = ->
      $controller "EmployeesController",
        $scope: @scope
        $location: @location
        SelectedEmployee: @selectedEmployee
        ModalDialog: @modalDialog
        ViewState: @viewState
        SessionService: @sessionService
        EmployeesService: @employeesService

  afterEach ->

  it 'is injectable', ->
    controller = @createController()
    expect(controller).not.to.be(undefined)

  describe 'init()', ->
    it 'updates the view state', ->
      @createController()
      expect(@viewState.current).to.be('employees')

    it 'adds an instance of SelectedEmployee to scope if an user is authorized', ->
      @selectedEmployee.instance = @employeeResource
      @sessionService.authorized.returns true
      @createController()
      expect(@scope.selectedEmployee).to.be(@selectedEmployee.instance)

    it 'calls service to gets all employess if an user is authorized', ->
      @sessionService.authorized.returns true
      @createController()
      expect(@employeesService.query.called).to.be.ok()

    it 'redirects to login page if an user is not authorized',
    inject((SessionService) ->
      stub = sinon.stub(SessionService, 'authorized').returns false
      @createController()
      expect(@location.path.calledWith('/login')).to.be.ok()
      stub.restore()
    )

  describe 'selected employee', ->
    it 'is stored into SelectedEmployee', ->
      @createController()
      employee = @employeeResource
      @scope.selectEmployee employee
      expect(@selectedEmployee.instance).to.be(employee)

    it 'is stored into scope object', ->
      @createController()
      employee = {}
      @scope.selectEmployee employee
      expect(@scope.selectedEmployee).to.be(employee)

    describe 'editing an employee', ->
      it 'updates location path', ->
        employeeID = 1010
        @scope.selectedEmployee = {
          id: employeeID
        }
        @createController()
        @scope.editEmployee()
        expect(@location.path.calledWith("/employees/#{employeeID}/edit")).to.be.ok()

    describe 'creating an employee', ->
      it 'updates location path', ->
        @createController()
        @scope.createEmployee()
        expect(@location.path.calledWith('/employees/new')).to.be.ok()

    describe 'deleting an employee', ->
      beforeEach ->
        @modalDialog.confirm.returns true

      it 'delete() of service is called', ->
        @selectedEmployee.instance = @employeeResource
        @createController()
        @scope.deleteEmployee()
        expect(@employeeResource.delete.calledOnce).to.be.ok()

      it 'removes stored instance of selected employee', inject(($rootScope, $q) ->
        @selectedEmployee.instance = @employeeResource
        @createController()
        @deferred.resolve()
        @scope.deleteEmployee()
#        # apply deferred result to scope
        $rootScope.$apply()
        expect(@selectedEmployee.instance).not.to.be.ok()
      )