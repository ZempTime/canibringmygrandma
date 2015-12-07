class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_photo

  def create
    @vote = current_user.votes.new vote_params
    @vote.photo = @photo

    if @vote.save
      redirect_to @photo, notice: "Your vote has been tallied"
    else
      redirect_to @photo, notice: "Problems Receiving Your Vote"
    end
  end

  private
    def set_photo
      @photo = Photo.find(params[:photo_id])
    end

    def vote_params
      params.require(:vote).permit(:photo_id, :user_id, :answer)
    end
end
