class Hike < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 7 }
  validates :content2, presence: true, length: { maximum: 9 }
  validates :content3, presence: true, length: { maximum: 7 }
end
