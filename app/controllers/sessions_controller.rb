class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:email], params[:password], params[:remenber_me])
    if user
      redirect_back_or_to root_url, :notice => "logged in!"
    else
      render :new
      flash.now.alert = "Email or password was invalid"
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => "logged out!"
  end
end
