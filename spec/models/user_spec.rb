require 'spec_helper'

describe User do
  before(:each) do
    @attr = { :name => "Example User", :displayname => "MyFull Namexxx", :email => "user@example.com" }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end

  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end

  it "should require a displayname" do
    no_name_user = User.new(@attr.merge(:displayname => ""))
    no_name_user.should_not be_valid
  end

  it "should require a email" do
    no_name_user = User.new(@attr.merge(:email => ""))
    no_name_user.should_not be_valid
  end

  it "should reject name that are too long" do
    long_name = "a" * 20
    long_name_user = User.new(@attr.merge(:name => long_name))
    long_name_user.should_not be_valid
  end

  it "should reject displayname that are too long" do
    long_name = "a" * 20
    long_name_user = User.new(@attr.merge(:displayname => long_name))
    long_name_user.should_not be_valid
  end

  it "should reject name that are too short" do
    long_name = "a" * 3
    long_name_user = User.new(@attr.merge(:name => long_name))
    long_name_user.should_not be_valid
  end

  it "should reject displayname that are too short" do
    long_name = "a" * 3
    long_name_user = User.new(@attr.merge(:displayname => long_name))
    long_name_user.should_not be_valid
  end

  it "should reject duplicate email addresses" do
    # Put a user with given email address into the database.
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

end
