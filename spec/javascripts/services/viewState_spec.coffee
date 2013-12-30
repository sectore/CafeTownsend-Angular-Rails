describe 'ViewState', ->

  beforeEach module('cafeTownsend.services')

  beforeEach inject ($injector) ->
    @service = $injector.get 'ViewState'

  afterEach ->
    @service = undefined

  it 'is injectable', ->
    expect(@service).to.be.ok()

  it 'set current state to login by default', ->
    expect(@service.current).to.be('login')

  it 'updates current state', ->
    newState = 'any-state'
    @service.current = newState
    expect(@service.current).to.be(newState)
