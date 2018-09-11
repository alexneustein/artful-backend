class Artist < ApplicationRecord
  has_many :images
  has_many :messages
  has_many :artists_types
  has_many :types, through: :artists_types

  # accepts_nested_attributes_for :type


  def full_name
    "#{self.name_first} #{self.name_last}"
  end

end
