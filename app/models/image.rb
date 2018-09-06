class Image < ApplicationRecord
  belongs_to :artist
  has_many :comments
end
