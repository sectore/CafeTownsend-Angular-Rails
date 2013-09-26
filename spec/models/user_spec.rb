require'spec_helper'

describe 'User' do
  before :each do
    @user_params = {
      :name => 'joe',
      :password => 'my-secure-pw',
      :password_confirmation => 'my-secure-pw'
    }  
  end
  
  it 'should be valid' do
    model = User.new(@user_params)
    expect(model).to be_valid
  end

  it "should invalid without a password" do
    model = User.create(@user_params.merge(:password => ''))
    expect(model).to_not be_valid
  end

  it "should be invalid without a password confirmation" do
    model = User.create(@user_params.merge(:password_confirmation => ''))
    expect(model).to_not be_valid
  end
end