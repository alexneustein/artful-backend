class Artist < ApplicationRecord
  has_many :images
  has_many :messages
  has_and_belongs_to_many :types

  def full_name
    "#{self.name_first} #{self.name_last}"
  end

end
