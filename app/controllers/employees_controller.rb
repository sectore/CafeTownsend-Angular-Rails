class EmployeesController < InheritedResources::Base

  before_filter :ensure_authenticated
 
  respond_to :json

end
