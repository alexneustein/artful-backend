class Image < ApplicationRecord
  belongs_to :artist
  has_many :comments

  self.per_page = 15

  def self.top_images(amt)
    imageArray = Image.all.sort_by {|image| image.likes}
    imageArray = imageArray.reverse
    topImageArray = imageArray[0..(amt-1)]
    return topImageArray
  end

end
