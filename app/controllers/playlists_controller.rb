class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:edit, :update]
  layout false
  layout 'application', :except => :new


  def edit
    @playlist = current_playlist
    render :layout => "../playlists/edit"
  end

  def update
    if @playlist.update(playlist_params)
      redirect_to home_closefb_path, notice: "Youtube playlist successfully updated."
    else
      render :layout => "../playlists/edit"
    end
  end

  private

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

  def playlist_params
    params.require(:playlist).permit(:link)
  end

  def current_playlist
    Playlist.find(params[:id])
  end
end


