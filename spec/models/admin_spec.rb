require File.dirname(__FILE__) + '/../spec_helper'

describe Admin do
  def new_admin(attributes = {})
    attributes[:email] ||= 'foo@example.com'
    attributes[:password] ||= 'abc123'
    attributes[:password_confirmation] ||= attributes[:password]
    Admin.new(attributes)
  end

  before(:each) do
    Admin.delete_all
  end

  it "should be valid" do
    new_admin.should be_valid
  end

  it "should require password" do
    new_admin(:password => '').should have(1).error_on(:password)
  end

  it "should require well formed email" do
    new_admin(:email => 'foo@bar@example.com').should have(1).error_on(:email)
  end

  it "should validate uniqueness of email" do
    new_admin(:email => 'bar@example.com').save!
    new_admin(:email => 'bar@example.com').should have(1).error_on(:email)
  end

  it "should validate password is longer than 3 characters" do
    new_admin(:password => 'bad').should have(1).error_on(:password)
  end

  it "should require matching password confirmation" do
    new_admin(:password_confirmation => 'nonmatching').should have(1).error_on(:password)
  end

  it "should generate password hash and salt on create" do
    admin = new_admin
    admin.save!
    admin.password_hash.should_not be_nil
    admin.password_salt.should_not be_nil
  end


  it "should authenticate by email" do
    admin = new_admin(:email => 'foo@bar.com', :password => 'secret')
    admin.save!
    Admin.authenticate('foo@bar.com', 'secret').should == admin
  end

  it "should not authenticate bad username" do
    Admin.authenticate('nonexisting', 'secret').should be_nil
  end

  it "should not authenticate bad password" do
    new_admin(:email => 'foo@bar.com', :password => 'secret').save!
    Admin.authenticate('foo@bar.com', 'badpassword').should be_nil
  end
end


# == Schema Information
#
# Table name: admins
#
#  id            :integer         not null, primary key
#  email         :string(255)
#  password_hash :string(255)
#  password_salt :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  auth_token    :string(255)
#

