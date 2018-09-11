# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
###################
## How many artists?#
## Must be > 100
num_artists = 100
###################
test_pw = "testing"

def generate_types
  type_array = []
  Type.all.each do |type|
    (type_array << type.id) if (rand(0..1) == 1)
  end
  return type_array
end

def generate_images(type_array)
  image_url_array = []
  type_array.each do |type|
    typename = Type.find(type).type_name.sub(' ', '%20')
    imagestring = 'https://api.giphy.com/v1/gifs/search?q=' + typename + '&api_key=RmAgqsS7izavtgXBLHLvsDmL0MAjBTF4'
    json_image = JSON.parse(RestClient.get(imagestring))
    num_images = rand(0..2)
    for i in 0..num_images do
      image_url_array << json_image["data"][i]["images"]["original"]["url"]
    end
  end
  return image_url_array
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

puts "Populating Artists..."

num_artists.times do
  puts "Populating Artist..."
  name_first = Faker::Name.first_name
  name_last = Faker::Name.last_name
  username = name_first[0] + name_last + rand(1..999).to_s
  password = test_pw
  abouttext = "Stuff about this artist."
  likes = rand(0..999)
  artist = Artist.create(name_first: name_first, name_last: name_last, username: username,  password: test_pw, about: abouttext, likes: likes)

  puts "Adding Types To Artist..."
  type_array = generate_types
  artist_id = artist.id
  if type_array.length > 0
    type_array.each do |type|
      ArtistsType.create({ artist_id: artist_id, type_id: type})
    end
  end

  puts "Adding Images to Artist..."
  if type_array.length > 0
    image_url_array = generate_images(type_array)
    if image_url_array.length > 0
      image_url_array.each do |url|
        image_date = Faker::Date.between(4.years.ago, Date.today)
        title = Faker::RickAndMorty.location
        details = Faker::Myst.quote
        img_likes = rand(0..99)
        Image.create({ artist_id: artist_id, image_date: image_date, title: title, likes: img_likes, details: details, url: url})
      end
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
    Comment.create({ image_id: image_id, comment: comment, author: author })
  end
end
