class Starship < ApplicationRecord
  has_many :garages
  has_many :characters, through: :garages
end
