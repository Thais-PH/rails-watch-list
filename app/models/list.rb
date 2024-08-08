class List < ApplicationRecord
  has_many :bookmarks
  has_many :movies, through: :bookmarks, dependent: :destroy

  # Une liste doit avoir un nom unique.
  validates :name, presence: true, uniqueness: true
end
