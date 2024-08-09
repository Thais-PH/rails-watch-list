class List < ApplicationRecord
  has_many :bookmarks
  has_many :movies, through: :bookmarks, dependent: :destroy
  has_one_attached :photo

  # Une liste doit avoir un nom unique.
  validates :name, presence: true, uniqueness: true
end
