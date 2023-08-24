class Tweet < ApplicationRecord
  validates :profile_picture_url, presence: true
  belongs_to :user
end
