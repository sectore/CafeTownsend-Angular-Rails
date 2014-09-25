require 'spec_helper'

describe EmployeesController, :type => :controller do

  let!(:employee_built) { build(:employee) } # saved in memory only
  let!(:employee_created) { create(:employee) } # saved in db
  let(:valid_attributes) { attributes_for(:employee) }
  let(:invalid_attributes) { {halli: 'galli'} }

  before :each do
    # ensure an user is logged in
    login_user create(:user)
    # avoid rendering html of single page app (RSpec only)
    request.env["HTTP_ACCEPT"] = "application/json"
  end

  # index
  # ---------------------------------------------
  describe 'GET index' do
    it "assigns all employees as @employees" do
      get :index, format: 'json'
      expect(assigns(:employees)).to match_array([employee_created])
    end
  end

  # create
  # ---------------------------------------------
  describe "POST create" do
    context "with valid params" do
      it "save a new Employee" do
        expect {
          post :create, {:employee => valid_attributes}
        }.to change(Employee, :count).by(1)
      end

      it "assigns a newly created employee as @employee" do
        post :create, {:employee => valid_attributes}
        expect(assigns(:employee)).to be_a(Employee)
        expect(assigns(:employee)).to be_persisted
      end
    end
    context "with invalid params" do
      it "does not save the new employee" do
        expect {
          post :create, {:employee => invalid_attributes}
        }.to change(Employee, :count).by(0)
      end
    end
  end

  # update
  # ---------------------------------------------
  describe 'PATCH update' do
    context "with valid params" do
      it "the requested employee is be updated" do
        allow(employee_created).to receive(:update).with(valid_attributes.stringify_keys) { true }
        patch :update, id: employee_created.to_param, employee: valid_attributes
        expect(assigns(:employee)).to eq(employee_created)
      end
    end
    context "with invalid params" do
      it "assigns the employee as @employee without any updates" do
        # stub save to avoid saving any updates
        Employee.any_instance.stub(:save).and_return(false)
        patch :update, id: employee_created.to_param, employee: invalid_attributes
        expect(assigns(:employee)).to eq(employee_created)
      end
    end
  end

  # delete
  # ---------------------------------------------
  describe "DELETE destroy" do
    it "destroys the requested employee" do
      expect {
        delete :destroy, {:id => employee_created.to_param}
      }.to change(Employee, :count).by(-1)
    end
  end

end