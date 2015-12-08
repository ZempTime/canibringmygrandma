class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_filter :add_allow_credentials_headers

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
    puts params
    @photo = current_user.photos.new photo_params
    #@photo = Photo.new photo_params

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: "Upload Successful...for the grandmas!" }
        format.js
        format.json { byebug }
      else
        format.html { render :new, notice: "Problems with this upload" }
        format.js
      end
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

    def add_allow_credentials_headers
      response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'
      response.headers['Access-Control-Allow-Credentials'] = 'true'
    end

    def options
      head :status => 200, :'Access-Control-Allow-Headers' => 'accept, content-type'
    end
end
