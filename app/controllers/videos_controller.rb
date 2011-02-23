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
    @title = "New Video"
    @video = Video.new(params[:video])
    if @video.save
      redirect_to videos_path, :notice => "Video was successfully created."
    else
      render :action => :new
    end
  end

  def show
    @video = Video.find(params[:id])
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

end
