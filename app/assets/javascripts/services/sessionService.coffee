angular.module('cafeTownsend.services').factory 'SessionService', ['$log', '$resource', ($log, $resource) ->

  service = $resource 'sessions/:param', {},
    'login':
      method: 'POST'
    'logout':
      method: 'DELETE'

  _user = {}

  authorized = ->
    _user.authorized is "true"

  login = (user, resultHandler, errorHandler) ->
    service.login user
    , (result) ->
      _user = result.user || {}
      _user.authorized = result.authorized
      resultHandler(result) if angular.isFunction resultHandler
    , (error) ->
      errorHandler(error) if angular.isFunction errorHandler

  logout = (resultHandler, errorHandler) ->
    service.logout param: _user.id
    , (result) ->
      _user = {}
      resultHandler(result) if angular.isFunction resultHandler
    , (error) ->
      errorHandler(error) if angular.isFunction errorHandler

  getUser = ->
    _user

  {
    login,
    logout,
    authorized,
    getUser
  }
]