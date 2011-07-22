class SessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.authenticate(params[:login], params[:password])
    if admin
      if params[:remember_me]
         cookies.permanent[:auth_token] = admin.auth_token
      else
        cookies[:auth_token] = admin.auth_token
      end
     
      redirect_to_target_or_default root_url, :notice => "Logged in successfully."
    else
      flash.now[:alert] = "Invalid login or password."
      render :action => 'new'
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => "You have been logged out."
  end
end
