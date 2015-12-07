class PhotosController < ApplicationController
  before_action :authenticate_user!

  def answer
    @photo = current_user.unvoted_photo

    redirect_to @photo if @photo
  end

  def show
    @photo = Photo.find(params[:id])
    @photo.add_view!

    @vote = set_vote
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

    def set_vote
      vote = @photo.votes.where(user_id: current_user.id)
      if vote.any?
        vote.first
      else
        @photo.votes.new
      end
    end
end
