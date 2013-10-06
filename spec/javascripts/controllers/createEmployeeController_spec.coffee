describe 'module cafeTownsend', ->

  beforeEach module('cafeTownsend')

  describe '- CreateEmployeeController', ->

    beforeEach inject ($rootScope, $controller, $location, SessionService) ->
      # routes
      @location = $location
      @location.path '/employees/new'
      # scope
      @scope = $rootScope.$new()
      # controller factory
      @createController = ->
        controller = $controller "CreateEmployeeController",
          $scope: @scope

    afterEach ->
      @scope = undefined

    it 'is injectable', ->
      controller = @createController()
      expect(controller).not.to.be(undefined)

    describe 'initialize()', ->
      it 'updates the view state', inject((ViewState) ->
        @createController()
        expect(ViewState.current).to.be('create')
      )

      it 'set isCreateForm to true', ->
        @createController()
        expect(@scope.isCreateForm).to.be.ok()

      it 'routes back to login page if an user is not authorized', inject((SessionService) ->
        stub = sinon.stub(SessionService, 'authorized').returns false
        @createController()
        expect(@location.path()).to.equal('/login')
        stub.restore()
      )

      it 'creates a selected employee if an user is authorized', inject((SelectedEmployee, SessionService) ->
        stub = sinon.stub(SessionService, 'authorized').returns true
        @createController()
        expect(SelectedEmployee.instance).not.to.be(undefined)
        stub.restore()
      )

      it 'adds the selected employee to scope if an user is authorized', inject((SelectedEmployee, SessionService) ->
        stub = sinon.stub(SessionService, 'authorized').returns true
        @createController()
        expect(@scope.selectedEmployee).not.to.be(undefined)
        stub.restore()
      )

    describe 'scope', ->
      it 'browseToOverview() updates the url', ->
        @createController()
        @scope.browseToOverview()
        expect(@location.path()).to.be('/employees')

      it 'browseToOverview() disposes the selected employee', inject((SelectedEmployee) ->
        @createController()
        @scope.browseToOverview()
        expect(SelectedEmployee.instance).to.be(undefined)
      )

      it 'submit() creates an employee',inject((SessionService, SelectedEmployee) ->
        stub = sinon.stub(SessionService, 'authorized').returns true
        controller = @createController()
        spy = sinon.spy(SelectedEmployee.instance, 'create')
        @scope.submit()
        expect(spy.calledOnce).to.be.ok()
        stub.restore()
        spy.restore()
      )
