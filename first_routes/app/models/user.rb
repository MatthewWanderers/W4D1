# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :artworks,
  foreign_key: :artist_id,
  class_name: :Artwork

  has_many :views,
  foreign_key: :viewer_id,
  class_name: :ArtworkShare
end
