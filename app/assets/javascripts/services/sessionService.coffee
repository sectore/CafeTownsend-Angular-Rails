angular.module('cafeTownsend.services').factory('SessionService', [
  '$log'
  '$resource'
  ($log, $resource)->

    service = $resource '/sessions/:param', {},
      'login':
        method: 'POST'
      'logout':
        method: 'DELETE'

    # login
    # ------------------------------------------------------------

    authorized = ->
      getCurrentUser().authorized is 'true'

    login = (newUser)->
      promise = service.login(newUser).$promise
      promise.then((result)->
        updateCurrentUser(result.user, result.authorized)
      )
      promise

    # logout
    # ------------------------------------------------------------

    logout = ->
      promise = service.logout(param: currentUser.id).$promise
      updateCurrentUser {}, false
      promise

    # user
    # ------------------------------------------------------------

    currentUser = {}

    getCurrentUser = ->
      currentUser

    # helper method to update currentUser
    updateCurrentUser = (user, authorized)->
      if user
        currentUser.id = user.id
        currentUser.name = user.name

      currentUser.authorized = authorized

    {
      login
      logout
      authorized
      getCurrentUser
    }
])