# all directives
angular.module('cafeTownsend')
.directive(
  'dateFormatValidator', ->
    pattern = /(19|20)\d\d[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])/
    {
      require: 'ngModel',
      link: ($scope, element, attrs, ngModel) ->
        ngModel.$validators.dateFormat = (value) ->
          pattern.test value
    }
)

.directive(
  'emailFormatValidator', ->
    pattern = /[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,4}/
    {
      require: 'ngModel',
      link: ($scope, element, attrs, ngModel) ->
        ngModel.$validators.emailFormat = (value) ->
          pattern.test value
    }
)