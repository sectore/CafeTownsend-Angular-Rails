###
  Simple Service to share data of application view state,
  which is acting as a domain model.
  The view state is set by controllers.

  Application view states are:
    'login'
    'employees'
    'edit'
    'create'

###
angular.module('cafeTownsend.services').factory 'ViewState'
, ['$log'
, ($log) ->

    current = 'login'

    {
      current
    }

]