Fabricator(:item) do
   title { Faker::Lorem.word }
   slogan { Faker::Lorem.sentence(5) }
   description { Faker::Lorem.paragraph(3) }
   price Random.new.rand(100)
#   img_url Dir.entries("#{Rails.root}/app/assets/images/").sample 
#   category Category.all.sample
end