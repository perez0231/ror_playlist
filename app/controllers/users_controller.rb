class UsersController < ApplicationController

  def index
  end

  def new
    @user= User.find_by(email:params[:email]).try(:authenticate, params[:password])
      if (@user)
        session[:user_id]=@user.id
        redirect_to '/songs/index'
      else
        flash[:errors] = ["Invalid Combination"]
  		redirect_to :back

    end
  end

  def create
    @user=User.create(fname:params[:fname], lname: params[:lname], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])

    if @user.valid?
      session[:user_id]=@user.id
      redirect_to '/song/index'

    else
    flash[:errors] = @user.errors.full_messages
    redirect_to "/"


  end
end


  def show
    @user=User.find(session[:user_id])
    @songs=Playlist.where(user: @user)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def logout
  session.clear
  redirect_to "/"
end
end
