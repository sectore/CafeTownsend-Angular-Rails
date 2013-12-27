describe 'module cafeTownsend', ->

  beforeEach module('cafeTownsend')

  describe '- EditEmployeeController', ->

    beforeEach inject ($rootScope, $controller, $location, SelectedEmployee) ->
      # routes
      @location = $location
      @location.path '/employees/edit'
      # scope
      @scope = $rootScope.$new()
      # services
      @selectedEmployee = SelectedEmployee
      @modalDialogMock =
        confirm: (message) ->
          true
      # controller factory
      @createController = ->
        controller = $controller "EditEmployeeController",
          $scope: @scope
          SelectedEmployee: @selectedEmployee
          ModalDialog: @modalDialogMock

    afterEach ->
      @scope =
      @location =
      @selectedEmployee.instance =
      @selectedEmployee =
      @modalDialogMock =
      undefined

    it 'is injectable', ->
      controller = @createController()
      expect(controller).not.to.be(undefined)

    describe 'init()', ->
      it 'updates the view state', inject((ViewState) ->
        @createController()
        expect(ViewState.current).to.be('edit')
      )

      it 'set isCreateForm to false', ->
        @createController()
        expect(@scope.isCreateForm).to.not.be.ok()

      it 'add selected employee to scope if an user is authorized',
      inject((SelectedEmployee, EmployeesService, SessionService) ->
        @selectedEmployee.instance = new EmployeesService()
        stub = sinon.stub(SessionService, 'authorized').returns true
        @createController()
        expect(@scope.selectedEmployee).not.to.be(undefined)
        stub.restore()
      )

      it 'have not an selected employee if an user is not authorized', inject((SessionService) ->
        stub = sinon.stub(SessionService, 'authorized').returns false
        @createController()
        expect(@scope.selectedEmployee).to.be(undefined)
        stub.restore()
      )

      it 'routes back to login page if an user is not authorized', inject((SessionService) ->
        stub = sinon.stub(SessionService, 'authorized').returns false
        @createController()
        expect(@location.path()).to.equal('/login')
        stub.restore()
      )

    describe 'navigation', ->
      it 'updates the url calling browseToOverview() ', ->
        @createController()
        @scope.browseToOverview()
        expect(@location.path()).to.be('/employees')

    describe 'selectedEmployee', ->
      it 'is deleted', inject((EmployeesService) ->
        @selectedEmployee.instance = new EmployeesService()
        @createController()
        spy = sinon.spy(@selectedEmployee.instance, 'delete')
        @scope.deleteEmployee()
        expect(spy.calledOnce).to.be.ok()
        spy.restore()
      )

      it 'is updated submitting the form', inject((EmployeesService) ->
        @selectedEmployee.instance = new EmployeesService()
        @createController()
        spy = sinon.spy(@selectedEmployee.instance, 'update')
        @scope.submit()
        expect(spy.calledOnce).to.be.ok()
        spy.restore()
      )
