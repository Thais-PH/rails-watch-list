class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  # Un signet doit être lié à un film et une liste, et les associations [film, liste] doivent être uniques.
  # Le commentaire associé à un signet ne peut pas avoir moins de 6 caractères.
  validates :movie, uniqueness: { scope: :list }
  validates :comment, presence: true, length: { minimum: 6 }
end
