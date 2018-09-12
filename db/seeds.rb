# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
test_pw = "testing"

def generate_types
  type_array = []
  type_array << Type.all[rand(0..(Type.all.length-1))].id
  Type.all.each do |type|
    (type_array << type.id) if (rand(0..3) == 1)
  end
  return type_array.uniq
end

def generate_tags
  hashtags = ["bloomsday", "nuh-uh", "humblebrag", "coolbeans", "itcamefromplanetduh", "eyebrowsonfleek", "tfw", "amirite", "bromance", "killingit", "winning", "nerding out", "firstworldproblems", "handleyourscandal", "adulting", "octothorpe", "whatHaveIBecome", "wineoclock", "freebeer", "duvetday", "failwhale", "staringIntoTheMiddleDistance", "LIT", "wtf", "sorrynotsorry", "yolo", "squadgoals", "nocarbsnoworries"]
  tag_array = []
  num_tags = rand(1..4)
  num_tags.times do
    tag_array << hashtags[rand(hashtags.length)]
  end
  tag_array.uniq!
  tag_string = "#" + tag_array.join(" #")
  return tag_string
end

Type.destroy_all
Artist.destroy_all
ArtistsType.destroy_all
Image.destroy_all
Comment.destroy_all

puts "Creating Types..."
#
Type.create({ type_name: "Animation" })
Type.create({ type_name: "Digital Arts" })
Type.create({ type_name: "Graphic Design" })
Type.create({ type_name: "Hand Crafts" })
Type.create({ type_name: "Illustration" })
Type.create({ type_name: "Film and Video" })
Type.create({ type_name: "Painting" })
Type.create({ type_name: "Photography" })
Type.create({ type_name: "Sculpture" })
Type.create({ type_name: "Visual Arts" })

puts("Getting Images...")
image_url_array = []
json_image = JSON.parse(RestClient.get("https://picsum.photos/list"))
json_image.each do |image|
  puts("Creating Artist...")
    name = image["author"]
    name_array = name.split(' ')
    name_first = name_array[0]
    name_last = name_array[-1]
    artist = Artist.find_or_create_by(name_first: name_first, name_last: name_last)
  puts("Creating Image Specs...")
    image_date = Faker::Date.between(4.years.ago, Date.today)
    title = Faker::RickAndMorty.location
    details = Faker::GreekPhilosophers.quote
    img_likes = rand(0..99)
    img_url = "https://picsum.photos/600/400?image=" + image["id"].to_s
    Image.create({ artist_id: artist.id, image_date: image_date, title: title, likes: img_likes, details: details, url: img_url})
end

puts("Adding Artist Info...")
theartist = nil
Artist.all.each do |artist|
  theartist = artist
  theartist.username = theartist.name_first[0] + theartist.name_last + rand(1..999).to_s
  theartist.password = test_pw
  theartist.about = Faker::MostInterestingManInTheWorld.quote
  theartist.likes = rand(0..999)
  theartist.save
end

puts "Adding Types To Artist..."
  Artist.all.each do |artist|
    type_array = generate_types
    artist_id = artist.id
    if type_array.length > 0
      type_array.each do |type|
        ArtistsType.create({ artist_id: artist_id, type_id: type})
      end
    end
  end

puts "Adding Comments to Images..."
  Image.all.each do |image|
    num_comments = rand(0..3)
    image_id = image.id
    num_comments.times do
      comment = Faker::DumbAndDumber.quote + " " + generate_tags
      author = Faker::FunnyName.two_word_name
      comment_likes = rand(0..4)
      Comment.create({ image_id: image_id, comment: comment, author: author, likes: comment_likes })
    end
  end
