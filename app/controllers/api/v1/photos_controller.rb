class Api::V1::PhotosController < ApplicationController
  before_action :find_photo, only: [:show, :destroy]
  skip_before_action :authorized, only: [:show]
  
  def show
    render json: { photo: PhotoSerializer.new(@photo) }, status: :ok
  end
  
  def create
    @photo = Photo.create(photo_params)
    if @photo.valid?
      render json: { photo: PhotoSerializer.new(@photo) }, status: :created
    else
      render json: { error: 'failed to create photo' }, status: :not_acceptable
    end
  end
  
  def destroy
    @photo.delete
    render json: {}, status: :accepted
  end

  private

  def photo_params
    params.require(:photo).permit(:user_id, :is_public, :base64_src)
  end
  
  def find_photo
    @photo = Photo.find(params[:id])
  end

end
