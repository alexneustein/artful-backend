class Artist < ApplicationRecord
  has_many :artists
  has_many :messages
  has_many :artists_types
  has_many :types, through: :artists_types

  self.per_page = 15

  def full_name
    "#{self.name_first} #{self.name_last}"
  end

  def self.top_artists(amt)
    artistArray = Artist.all.sort_by {|artist| artist.likes}
    artistArray = artistArray.reverse
    topArtistArray = artistArray[0..(amt-1)]
    return topArtistArray
  end

end
