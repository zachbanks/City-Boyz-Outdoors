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

  def show
    @video = Video.find(params[:id])
    @title = @video.title
  end

  def create
    @title = "New Video"
    @video = Video.new(params[:video])
    @video.source_url = format_vimeo_video_url(@video.source_url)
    if @video.save
      redirect_to videos_path, :notice => "Video was successfully created."
    else
      render :action => :new
    end
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
    video = Video.find(params[:id])
    msg = "#{video.title} successfully deleted."
    video.destroy
    redirect_to videos_path, :flash => { :success => msg }
  end
  
  private
  # TODO: Determine where this method should be housed.
  def format_vimeo_video_url(url)
    Nokogiri::HTML(url).search("iframe/@src").to_s
  end

end
