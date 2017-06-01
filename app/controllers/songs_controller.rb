class SongsController < ApplicationController
   before_action :required_login
  def index
    @user=User.find(session[:user_id])
    @songs=Song.all.order(created_at: :desc)

  end

  def create
    @song=Song.create(artist: params[:artist], title: params[:title], times_added: 0)



    if @song.valid?
      redirect_to :back

    else
    flash[:errors] = @song.errors.full_messages
    redirect_to :back
  end
  end

  def show
    @user=User.find(session[:user_id])
    @song=Song.find(params[:id])
    @playlist=Playlist.where(song: @song)
  end
  def add
    @user=User.find(session[:user_id])
    @song=Song.find(params[:id])

    Song.find(params[:id]).increment!(:times_added)

    playlist=Playlist.find_by(user: @user, song: @song)

    if playlist
      playlist.increment!(:user_added)
      redirect_to :back
    else
    Playlist.create(song:@song, user:current_user, user_added: 1)
    redirect_to :back
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end
end
