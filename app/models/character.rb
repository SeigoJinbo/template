class Character < ApplicationRecord
  belongs_to :planet
  has_many :garages
  has_many :starships, through: :garages
end
