class SessionsController < ApplicationController

  def new
  end

  def create
   @user = User.find_by(params[:username])
    if @user && @user.authenticate(params[:password])
     session[:user_id] = @user.id
     redirect_to '/'
   else
     render 'new'
   end
 end

 def destroy
   session[:user_id] = nil
   redirect_to '/'
 end

 end
