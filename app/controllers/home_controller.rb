class HomeController < ApplicationController

  def index
    @photos = Photo.valid_photos.sample(3)
  end
end
