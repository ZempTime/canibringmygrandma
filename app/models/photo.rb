class Photo < ActiveRecord::Base
  belongs_to :user

  include ImageUploader[:image]

  validates_presence_of :image
  validates_presence_of :user_id
  validates_presence_of :location
end
