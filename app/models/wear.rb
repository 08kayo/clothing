class Wear < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :wears

  belongs_to :user
  has_many :favorites
  has_many :users, through: :favorites
  has_many :categories
  has_many :tags
  has_many :likes, dependent: :destroy
  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end
  mount_uploader :image, ImageUploader

end