class Api::V1::AlbumsController < ApplicationController
before_action :find_album, only: [:show, :destroy]  
  
  def show
    render json: { photo: AlbumSerializer.new(@album) }, status: :ok
  end
  
  def create
    @album = Album.create(album_params)
    if @album.valid?
      render json: { album: AlbumSerializer.new(@album) }, status: :created
    else
      render json: { error: 'failed to create album' }, status: :not_acceptable
    end
  end
  
  def update
    @album.update(album_params)
    render json: { album: AlbumSerializer.new(@album) }, status: :ok
  end
  
  def destroy
    @album.delete
    render json: {}, status: :accepted
  end

  private

  def album_params
    params.require(:album).permit(:user_id, :photo_ids, :name)
  end
  
  def find_album
    @album = Album.find(params[:id])
  end

end
