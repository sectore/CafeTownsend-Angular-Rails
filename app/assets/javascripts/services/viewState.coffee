###
  Simple Service to share data of current view state, which is acting as a domain model.
  The view state set by controllers.


  Current view states are:
    'login'
    'employees'
    'edit'
    'create'

###
angular.module('cafeTownsend.services').factory 'ViewState'
, ['$log'
, ($log) ->

    current = ''

    {
      current
    }

]