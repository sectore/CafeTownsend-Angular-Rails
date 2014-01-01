###
  Simple Service to share data of an instance of selected employee (RailsResource)
  beetween controllers, which is acting as a domain model.
  For more information about RailsResource check http://ngmodules.org/modules/angularjs-rails-resource
###
angular.module('cafeTownsend.services').factory 'SelectedEmployee'
  , ['$log'
  , ($log) ->

    # @return An instance of selected employee,
    # which is behind the scenes an instance of RailsResource.
    # It is undefined by default.
    instance: undefined

  ]