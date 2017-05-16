class Like < ActiveRecord::Base
  belongs_to :wear, counter_cache: :likes_count
  belongs_to :user
end