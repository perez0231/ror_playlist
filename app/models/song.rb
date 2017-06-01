class Song < ApplicationRecord
  has_many :playlists
  has_many :users, through: :playlists
  validates :artist, presence: true, length: {minimum: 2}
  validates :title, presence: true, uniqueness: true, length: {minimum: 2}
end
