class Artist < ApplicationRecord
  has_many :images
  has_many :messages
  has_and_belongs_to_many :types
end
