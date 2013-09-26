require'spec_helper'

describe 'Employee' do
  before :each do
    @employee_params = {
      :first_name => 'Joe',
      :last_name => 'Doe',
      :email => 'jd@cafetownsend.com',
      :start_date => DateTime.new()
    }
  end
  
  it 'should be valid' do
    model = Employee.new(@employee_params)
    expect(model).to be_valid
  end

  it "should invalid without a first name" do
    model = Employee.create(@employee_params.merge(:first_name => ''))
    expect(model).to_not be_valid
  end

  it "should invalid without a last name" do
    model = Employee.create(@employee_params.merge(:last_name => ''))
    expect(model).to_not be_valid
  end

  it "should invalid without an email" do
    model = Employee.create(@employee_params.merge(:email => ''))
    expect(model).to_not be_valid
  end

  it "should invalid without a start date" do
    model = Employee.create(@employee_params.merge(:start_date => nil))
    expect(model).to_not be_valid
  end
end