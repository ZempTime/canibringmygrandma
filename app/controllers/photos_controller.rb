class PhotosController < ApplicationController
  before_action :authenticate_user!

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.new photo_params
    #@photo = Photo.new photo_params

    if @photo.save
      redirect_to @photo, notice: "Upload Successful...for the grandmas!"
    else
      render :new, notice: "Problems with this upload"
    end
  end

  private
    def photo_params
      params.require(:photo).permit(:image, :user_id, :remove_image, :cached_image_data, :location)
    end
end
