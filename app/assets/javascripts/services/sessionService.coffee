angular.module('cafeTownsend.services').factory('SessionService', [
  '$log'
  '$resource'
  ($log, $resource)->
    service = $resource '/sessions/:param', {},
      'login':
        method: 'POST'
      'logout':
        method: 'DELETE'

    user = {}

    authorized = ->
      user.authorized is "true"

    login = (newUser, resultHandler, errorHandler) ->
      service.login newUser
      , (result) ->
        user = result.user || {}
        user.authorized = result.authorized
        resultHandler(result) if angular.isFunction resultHandler
      , (error) ->
        errorHandler(error) if angular.isFunction errorHandler

    logout = (resultHandler, errorHandler) ->
      service.logout param: user.id
      , (result) ->
        user = {}
        resultHandler(result) if angular.isFunction resultHandler
      , (error) ->
        errorHandler(error) if angular.isFunction errorHandler

    getUser = ->
      user

    {
      login
      logout
      authorized
      getUser
    }
])