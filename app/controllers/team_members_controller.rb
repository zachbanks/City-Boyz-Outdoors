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
  
  def create
    @title = "New Team Member"
    if team_member.save
      redirect_to team_members_path, :notice => "#{team_member.name} added as a team member."
    else
      render :action => :new
    end
  end
  
  def edit
    @title = "Editing #{team_member.name}"
  end
  
  def update
    if team_member.update_attributes(params[:team_member])
      redirect_to team_members_path, :notice => "#{team_member.name} was succesfully updated."
    else
      render :action => :edit
    end
  end
  
  def destroy
    msg = "#{team_member.name} was succesfully deleted."
    team_member.destroy
    redirect_to team_members_path, :flash => { :success => msg }
  end
  
end
