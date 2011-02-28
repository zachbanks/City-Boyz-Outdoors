# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# Creates videos.
vc = VideosController.new
last_video = Video.last
if last_video
  num = last_video.id
else
  num = 1
end
(num + 1).upto((num + 99)) do |i|
  Video.create(
    :title => "Video #{i}",
    :description => "This is the description for video #{i}.",
    :source_url => vc.instance_eval do
      format_vimeo_video_url('<iframe src="http://player.vimeo.com/video/20156252?title=0&amp;byline=0&amp;portrait=0&amp;color=9dca68" width="940" height="705" frameborder="0"></iframe>')
    end
  )
end