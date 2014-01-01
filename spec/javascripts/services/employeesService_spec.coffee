describe 'EmployeesService', ->

  beforeEach module('cafeTownsend.services')

  beforeEach inject ($injector) ->
    @service = $injector.get 'EmployeesService'

  afterEach ->
    @service = undefined

  it 'is injectable', ->
    expect(@service).to.be.ok()