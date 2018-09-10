# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[["Lucas"], ["lukaz"], ["bringo"], ["buckwheat"]].each do |arr|
  User.create!(username: arr[0])
end

[["cheese", "asdfghjkl", 1], ["cheese", "asdfjkl", 2], ["untitled", "qwerty", 3], ["titled", "poiuyt", 1],
  ["red", "asjkl", 2], ["blue", "jkjkjkjk", 4], ["untitled 2", "ghjkl", 3], ["american gothic", "lkjhgf", 1]].each do |arr|
    Artwork.create!(title: arr[0], image_url: arr[1], artist_id: arr[2])
  end

[[1, 2], [1, 3], [1, 4], [2, 3], [3, 7], [4, 6], [1, 8], [3, 3], [4, 5]].each do |arr|
  ArtworkShare.create!(viewer_id: arr[0], artwork_id: arr[1])
end