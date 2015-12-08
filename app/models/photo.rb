class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :voting_users, through: :votes, class_name: "User", foreign_key: "user_id", source: :user

  include ImageUploader[:image]

  validates_presence_of :image
  validates_presence_of :user_id
  validates_presence_of :location

  def self.valid_photos
    Photo.where.not(user_id: User.where(shadowbanned: true).pluck(:id))
  end

  def add_view!
    update(views: views + 1)
  end

  def yes_percent
    100 * (votes.where(answer: true).count / total)
  end

  def no_percent
    100 * (votes.where(answer: false).count / total)
  end

  def total
    votes.count
  end
end
