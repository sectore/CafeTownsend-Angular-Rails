require'spec_helper'

describe 'User' do
  it 'should be valid' do
    expect(build(:user)).to be_valid
  end

  it "should invalid without a password" do
    expect(build(:user, password: '')).to_not be_valid
  end

  it "should be invalid without a password confirmation" do
    expect(build(:user, password_confirmation: '')).to_not be_valid
  end
end