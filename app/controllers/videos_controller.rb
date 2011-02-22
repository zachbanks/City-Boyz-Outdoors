class VideosController < ApplicationController

  before_filter :login_required, :except => [:index, :show]

  def index
    @title = "Videos"
    @videos = Video.all
  end
  
  def new
   @title = "New Video"
   @video = Video.new
  end

  def create
    
  end

  def show
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

end
