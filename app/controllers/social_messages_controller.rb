class SocialMessagesController < ApplicationController
  
  def index
    @title = "Welcome to CityBoyzOutdoors.com"
    @latest_messages = latest_tweets
  end


  # Get most recent tweets from CityBoyzStow Twitter timeline.
  def latest_tweets(number_of_tweets=10)
    tweets = []
    Twitter.user_timeline(:count => number_of_tweets).each do |tweet|
      # Use Time.parse to convert time into local time.
      tweets << SocialMessage.new(:body => tweet.text, :source => "twitter", :date_posted => Time.parse(tweet.created_at))
    end
    tweets
  end

end
