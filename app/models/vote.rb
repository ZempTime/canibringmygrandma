class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :photo
  validates_presence_of :user_id, :photo_id
  validates_inclusion_of :answer, in: [true, false]

  def status
    return "results" if persisted?
    return "form"
  end
end
