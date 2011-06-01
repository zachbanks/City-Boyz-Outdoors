require 'spec_helper'

describe Video do
  subject { Factory(:video) }

  describe "validations" do

    context "success" do
      specify { should have(0).errors_on :title }
      specify { should have(0).errors_on :description } 
      specify { should have(0).errors_on :source_url }
    end

    context "failure" do
      it "should have no title error" do
        subject[:title] = nil
        should have(1).error_on :title
      end
      it "should have no description error" do
        subject[:description] = nil
        should have(1).error_on :description
      end
      it "should have no source_url error" do 
        subject[:source_url] = nil
        should have(2).error_on :source_url # 1 for presence, and 1 for format.
      end
    end

    describe "format validations" do
      describe "source_url" do
        it "should accept valid addresses" do
          valid = %w{ http://google.com http://www.google.com http://www.google.com?id=212 }
          valid.each do |url|
            subject[:source_url] = url
            should be_valid
          end
        end
        it "should reject invalid addresses" do
          invalid = %w{ www.google.com google.com zach_banks 23sfsa }
          invalid.each do |url|
            subject[:source_url] = url
            should_not be_valid
          end
        end
      end
    end

  end
  
  describe "ordering" do
    it "should return videos from newest to oldest" do
      v1 = Factory(:video, :created_at => 1.day.ago)
      v2 = Factory(:video, :created_at => 1.hour.ago)
      Video.all.should == [v2, v1]
    end
  end
  
  describe "permalinks" do
    it "should parameterized permalink" do

      subject.permalink.should == "#{subject.title.parameterize}"
    end
    it "should update permalink if title is changed" do
      subject.update_attributes :title => "New title"
      subject.permalink.should == "new-title"
    end
  end
  
end



# == Schema Information
#
# Table name: videos
#
#  id            :integer         not null, primary key
#  title         :string(255)
#  source_url    :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  description   :text
#  permalink     :string(255)
#  thumbnail_url :string(255)
#

