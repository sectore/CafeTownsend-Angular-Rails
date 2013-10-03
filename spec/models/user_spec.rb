require'spec_helper'

describe 'User' do
  context "valid params" do
    it 'build an user' do
      expect(build(:user)).to be_valid
    end
  end

  context "invalid params" do
    it "without a password" do
      expect(build(:user, password: '')).to have(2).errors_on(:password)
    end

    it "without a password confirmation" do
      expect(build(:user, password_confirmation: '')).to have(2).errors_on(:password_confirmation)
    end
  end
end