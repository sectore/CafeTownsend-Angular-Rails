# Teaspoon includes some support files, but you can use anything from your own support path too.
# require support/expect
# require support/sinon
# require support/your-support-file

# jquery
#= require jquery

# angular
#= require angular/angular
#= require angular-route/angular-route
#= require angular-animate/angular-animate
#= require angular-resource/angular-resource
#= require angular-mocks/angular-mocks
#= require ng-rails-csrf
#= require angularjs/rails/resource

# test helper
# =require support/mockFactory

# app
#= require modules
#= require services/sessionService
#= require services/employeesService
#= require services/selectedEmployee
#= require services/viewState
#= require controllers/mainController
#= require controllers/headerController
#= require controllers/loginController
#= require controllers/employeesController
#= require controllers/editEmployeeController
#= require controllers/createEmployeeController
#= require routes

#
# Deferring execution
# If you're using CommonJS, RequireJS or some other asynchronous library you can defer execution. Call Teaspoon.execute()
# after everything has been loaded. Simple example of a timeout:
#
# Teaspoon.defer = true
# setTimeout(Teaspoon.execute, 1000)
#
# Matching files
# By default Teaspoon will look for files that match _spec.{js,js.coffee,.coffee}. Add a filename_spec.js file in your
# spec path and it'll be included in the default suite automatically. If you want to customize suites, check out the
# configuration in config/initializers/teaspoon.rb
#
# Manifest
# If you'd rather require your spec files manually (to control order for instance) you can disable the suite matcher in
# the configuration and use this file as a manifest.
#
# For more information: http:#github.com/modeset/teaspoon
#
# You can require javascript files here. A good place to start is by requiring your application.js.
#= require application
