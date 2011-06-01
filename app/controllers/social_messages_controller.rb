class SocialMessagesController < ApplicationController
  
  expose(:social_message)
  
  before_filter :login_required, :except => :index
  
  def index
    @title = "Welcome to CityBoyzOutdoors.com"
    @latest_messages = latest_tweets
  end
  
  def new
    @title = "Post New Status"
  end
  
  def create
    @title = "Post New Status"
    if social_message.valid?
      begin
        Twitter.update(social_message.body)
      rescue
        redirect_to root_path, :flash => { :warning => "Sorry, an error has occurred." }
      end
      redirect_to root_path, :notice => "Your status has been posted!"
    else
      render :action => :new
    end
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
