class SessionsController < ApplicationController
  def create
    if user=User.authenticate(params[:email || :username], params[:password])
      session[:user_id]=user  
      redirect_to articles_path, :notice=>"#{user.username} successfully logged in"
    else
      flash.now[:alert]="Invalid username/password "
      render :new
    end
  end
  
  def destroy
    reset_session
    redirect_to articles_path, :notice=>"user successfully logged out"
  end
end
