class TeamMembersController < ApplicationController
  expose(:team_member)
  # TODO: Figure out why team_members is nil when using decent exposure.
  #expose(:team_members) 
  
  def index
    @title = "About Us"
    @team_members = TeamMember.all
  end
  
  def new
    @title = "New Team Member"
  end
  
end
