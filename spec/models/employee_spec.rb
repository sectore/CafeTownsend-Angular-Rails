require 'spec_helper'

describe 'Employee' do
  it 'should be valid' do
    expect(build(:employee)).to be_valid
  end

  it "should invalid without a first name" do
    expect(build(:employee, first_name: '')).to_not be_valid
  end

  it "should invalid without a last name" do
    expect(build(:employee, last_name: '')).to_not be_valid
  end

  it "should invalid without an email" do
    expect(build(:employee, email: '')).to_not be_valid
  end

  it "should invalid without a start date" do
    expect(build(:employee, start_date: nil)).to_not be_valid
  end

  it "should store into db", :focus do
    expect(create(:employee)).to_not be_nil
  end
end