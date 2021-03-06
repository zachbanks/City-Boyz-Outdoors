require 'spec_helper'

describe TeamMember do

  subject { Factory(:team_member) }

  describe "validations" do
    context "success" do
      specify { should have(0).errors_on :name }
      specify { should have(0).errors_on :email }
    end
    context "failure" do
      it "should have a no name error" do
        subject[:name] = nil
        should have(1).error_on :name
      end
      it "should have a no email error" do
        subject[:email] = nil
        should_not be_valid
      end
      it "should have an email regex error" do
        subject[:email] = 'johndoe' # TODO: Test more invalid emails.
        should_not be_valid
      end 
    end
  end
end



# == Schema Information
#
# Table name: team_members
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  bio        :text
#  created_at :datetime
#  updated_at :datetime
#  photo_url  :string(255)
#

