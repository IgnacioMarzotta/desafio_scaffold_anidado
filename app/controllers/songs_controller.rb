class SongsController < ApplicationController
    before_action :find_song, only: [:destroy]
    def create
        song = Song.new(song_params)
        song.playlist = Playlist.find(params[:playlist_id])
        if song.save
            redirect_to song.playlist, notice: 'La canción se ha creado con éxito!'
        else
            redirect_to playlists_path, notice: 'La canción no se ha guardado!'
        end
    end

    def destroy
        @song.delete
        redirect_to playlists_path, notice: 'Song was successfully annihilated'
    end

    def find_song
        @song = Song.find(params[:id])
    end

    private
    def song_params
        params.require(:song).permit(:name, :artist)
    end
end
