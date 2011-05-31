class VideosController < ApplicationController

  expose(:videos) { Video.page(params[:page]).per(9) }
  expose(:video)

  before_filter :login_required, :except => [:index, :show]
  
  def index
    @title = "Videos"
    videos = Video.search(params[:search])
  end
  
  def new
   @title = "New Video"
  end

  def show
    @title = video.title
  end

  def create
    @title = "New Video"
    video.source_url = format_vimeo_video_url(video.source_url)
    if video.save
      redirect_to videos_path, :notice => "Video was successfully created."
    else
      render :action => :new
    end
  end

  def edit
    @title = "Editing \"#{video.title}\""
  end

  def update
   if video.update_attributes(params[:video])
     redirect_to video, :flash => { :success => "#{video.title} was successfully updated." } 
   else
     render :action => :edit
   end
  end

  def destroy
    msg = "#{video.title} successfully deleted."
    video.destroy
    redirect_to videos_path, :flash => { :success => msg }
  end
  
  private
  # TODO: Determine where theses methods should be housed.
  def format_vimeo_video_url(url)
    Nokogiri::HTML(url).search("iframe/@src").to_s
  end

end
