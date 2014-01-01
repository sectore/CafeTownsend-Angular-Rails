testModule = angular.module('test', ['ngResource'])

testModule.factory 'MockFactory'
, ['$q'
  , ($q) ->

    deferred: $q.defer()

    location: ->
      path: sinon.stub().returns ''

    selectedEmployee: ->
      instance: undefined

    employeeResource:(id='123') ->
      id: id
      delete: sinon.stub().returns @deferred.promise
      update: sinon.stub().returns @deferred.promise

    employeesService: ->
      query: sinon.stub().returns @deferred.promise

    sessionService: ->
      login: sinon.stub().returns @deferred.promise
      logout: sinon.stub().returns @deferred.promise
      getCurrentUser: sinon.stub().returns @employeeResource()
      authorized: sinon.stub()

    modalDialog: ->
      confirm: sinon.stub()

    viewState: ->
      current: ''

]