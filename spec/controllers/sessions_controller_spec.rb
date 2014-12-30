require 'spec_helper'

describe SessionsController, :type => :controller do

  let!(:user_created) { create(:user) } # saved in db

  before :each do
    # avoid rendering html of single page app (RSpec only)
    request.env["HTTP_ACCEPT"] = "application/json"
  end

  # create
  # ---------------------------------------------
  describe "POST create" do
    context "with valid params" do
      it "an user is created and returned" do
        post :create, {name: user_created.name, password: user_created.password}
        expected_json = {user: user_created, authorized: 'true' }.to_json
        expect(response.body).to be_json_eql expected_json
      end
    end

    context "with invalid params" do
      it "an user is not logged in with an invalid password" do
        post :create, {name: user_created.name, password: user_created.password.reverse!}
        expected_json = {authorized: 'false' }.to_json
        expect(response.body).to eq expected_json
      end
      it "an user is not logged with an invalid name" do
        post :create, {name: user_created.name.reverse!, password: user_created.password}
        expected_json = {authorized: 'false' }.to_json
        expect(response.body).to eq expected_json
      end
    end


    # delete
    # ---------------------------------------------
    describe "DELETE destroy" do
      before :each do
        login_user user_created
      end
      it "returns false status of authorized" do
        delete :destroy, {id: user_created.to_param}
        expected_json = {authorized: 'false' }.to_json
        expect(response.body).to eq expected_json
      end
      it "destroys the session" do
        delete :destroy, {id: user_created.to_param}
        expect(session[:user_id]).to be_nil
      end
    end

  end

end