require File.join(File.dirname(__FILE__), "spec_helper")

describe User do
  before :each do
    @user = User.create!(:email => "test@test.com", :password => "password")
  end
  
  it "should work normally when no except clause is given" do
    User.first.should == @user
  end
  
  it "should not throw an error when using the except clause" do
    lambda{User.find(:all, :except => "password")}.should_not raise_error 
  end

  it "should only bring back all the fields except for the ones in the except clause" do
    User.first(:except => "password").attribute_names.should_not include(:password)
  end
end
