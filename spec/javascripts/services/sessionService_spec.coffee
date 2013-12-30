describe 'SessionService', ->

  beforeEach module('cafeTownsend.services')

  beforeEach inject ($injector, $httpBackend) ->
    @service = $injector.get 'SessionService'
    @$httpBackend = $httpBackend
    @user =
      id: 10
      name: 'luke'
      password: 'skywalker'

  afterEach ->
    @service = undefined
    @$httpBackend.verifyNoOutstandingExpectation()
    @$httpBackend.verifyNoOutstandingRequest()

  it 'is injectable', ->
    expect(@service).to.be.ok()

  it 'has an instance of an un-authorized user by default', ->
    expect(@service.authorized()).not.to.be.ok()

  describe 'login', ->
    it 'does authorize a valid user', ->
      loginResult = {}
      @$httpBackend.expectPOST('/sessions').respond(
        200,
        user: @user
        authorized: 'true'
      )

      @service.login(@user).then(
        (result)->
          loginResult = result
      )
      @$httpBackend.flush()
      expect(@service.authorized()).to.be.ok()

    it 'does not authorize an invalid user', ->
      loginResult = {}
      @$httpBackend.expectPOST('/sessions').respond(
        200,
        user: @user
        authorized: 'false'
      )
      @service.login(@user).then(
        (result)->
          loginResult = result
      )
      @$httpBackend.flush()
      expect(@service.authorized()).not.to.be.ok()

  describe "logout", ->
    it 'logged out an user', ->
      @$httpBackend.expectDELETE('/sessions').respond(
        200,
        authorized: 'false'
      )
      @service.logout()
      @$httpBackend.flush()
      expect(@service.authorized()).not.to.be.ok()
