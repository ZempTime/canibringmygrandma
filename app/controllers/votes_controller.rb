class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_photo

  def create
    @vote = current_user.votes.new vote_params
    @vote.photo = @photo

    respond_to do |format|
      if @vote.save
        format.js
        format.html { redirect_to @photo, notice: "Your vote has been tallied"}
      else
        format.js { redirect_to @photo, notice: "Problems Receiving Your Vote" }
        format.html {redirect_to @photo, notice: "Problems Receiving Your Vote" }
      end
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
