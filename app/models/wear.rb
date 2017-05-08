class Wear < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :wears

  belongs_to :user
  has_many :favorites
  has_many :categories

  mount_uploader :image, ImageUploader

end