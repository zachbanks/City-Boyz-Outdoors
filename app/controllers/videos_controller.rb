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
    @title = @video.title
  end

  def edit
    @video = Video.find(params[:id])    
    @title = "Editing #@video.title"
  end

  def update
   @video = Video.find(params[:id])
   if @video.update_attributes(params[:video])
     redirect_to @video, :flash => { :success => "#{@video.title} was successfully updated." } 
   else
     render :action => :edit
   end
  end

  def destroy
    
  end

end
