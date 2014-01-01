class EmployeesController < ApplicationController

  before_filter :ensure_authenticated
  before_filter :set_employee, :except => [:index, :create]

  respond_to :json

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/new
  def new
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    render json: @employee
  end


  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      render json: @employee
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1.json
  def update
    @employee.update_attributes!(employee_params)
    render json: @employee
  end

  # DELETE /employees/1
  def destroy
    @employee.destroy
    head :no_content
  end



  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :start_date)
  end

end