# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Create category"
['Book', 'Sport', 'Electronic', 'Movie', 'Food'].each do |name|
    Category.create(name: name)
end

def get_image
    Dir.entries("#{Rails.root}/app/assets/images/").select {|f| !File.directory? f}.sample
end

puts "Create users"
for i in (1..3) do
  Fabricate(:user, email: "user#{i}@mart.com")
end

puts "Create items"
20.times do
   it = Fabricate(:item, category: Category.all.sample, img_url: get_image)
   3.times do
        Fabricate(:review, item: it, user: User.all.sample)
   end
   it.stars = it.reviews.map(&:stars).reduce(:+)/3
   it.save
end

puts "Create items in cart"
Cart.all.each do |cart|
    cart.items << Item.all.sample(3)
end