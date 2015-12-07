class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  has_many :photos
  has_many :votes
  has_many :voted_photos, through: :votes, class_name: "Photo", foreign_key: "photo_id", source: :photo

  attr_accessor :login

  validates :username, :presence => true, :uniqueness => { :case_sensitive => false }

  def unvoted_photo
    valid_photos = Photo.valid_photos

    (valid_photos - voted_photos).sample
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_hash).first
    end
  end
end
