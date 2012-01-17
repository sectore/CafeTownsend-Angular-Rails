class EmployeesController < ApplicationController

  before_filter :ensure_authenticated
  before_filter :find_employees, :only => [:index]
  before_filter :find_employee, :except => [:index, :create]

  respond_to :json


  # GET /employees
  def index
    respond_with @employees
  end

  # GET /employees/1
  def show
    respond_with @employee
  end


  # POST /employees
  def create
    @employee = Employee.new(params[:employee])
    @employee.save
    respond_with @employee
  end

  # PUT /employees/1.json
  def update
    @employee.update_attributes(params[:employee])
    render :json => @employee
  end

  # DELETE /employees/1
  def destroy
    @employee.destroy
    render :json => {}
  end


  private

  def find_employees
    @employees = Employee.all
  end

  def find_employee
    @employee = Employee.find(params[:id])
  end

end
