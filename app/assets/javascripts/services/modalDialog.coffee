###
  Service to provide a modal dialog.
###
angular.module('cafeTownsend.services').factory 'ModalDialog'
, ['$window', ($window) ->
    confirm: (message) ->
      $window.confirm message
]