describe 'SelectedEmployee', ->

  beforeEach module('cafeTownsend.services')

  beforeEach inject ($injector) ->
    @service = $injector.get 'SelectedEmployee'

  afterEach ->
    @service = undefined

  it 'is injectable', ->
    expect(@service).to.be.ok()

  it 'has no instance by default', ->
    expect(@service.instance).not.to.be.ok()