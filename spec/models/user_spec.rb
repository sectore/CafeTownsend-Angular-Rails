require 'spec_helper'

describe 'User' do
  context "valid params" do
    it 'build an user' do
      user = build(:user)
      expect(user).to be_valid
    end
  end

  context "invalid params" do
    it "without a password" do
      user = build(:user, password: '')
      expect(user).to_not be_valid
    end

    it "without a password confirmation" do
      user = build(:user, password_confirmation: '')
      expect(user).to_not be_valid
    end

    it "with different password and password confirmation" do
      user = build(:user, password: 'password', password_confirmation: 'wrong-password')
      expect(user).to_not be_valid
    end
  end
end