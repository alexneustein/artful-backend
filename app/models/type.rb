class Type < ApplicationRecord
  has_many :artists_types
  has_many :artists, through: :artists_types
end
