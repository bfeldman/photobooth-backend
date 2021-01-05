class Api::V1::PhotosController < ApplicationController
  before_action :find_photo, only: [:show, :destroy]
  skip_before_action :authorized, only: [:show]
  
  def show
    render json: { photo: PhotoSerializer.new(@photo) }, status: :ok
  end
  
  def create
    @photo = Photo.create(photo_params)
    @photo.image_file.attach(io: image_io, filename: "photo" + @photo.id.to_s + ".png")
    
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
    params.require(:photo).permit(:user_id, :is_public, :base64_src, :caption)
  end
  
  def image_io
    decoded_image = Base64.decode64(params[:photo][:base64_src])
    StringIO.new(decoded_image)
  end
  
  def find_photo
    @photo = Photo.find(params[:id])
  end

end
