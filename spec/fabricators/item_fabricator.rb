Fabricator(:item) do
   title { Faker::Lorem.word }
   slogan { Faker::Lorem.sentence(8) }
   description { Faker::Lorem.paragraph(5) }
   stars 0
   price Random.new.rand(100)
   img_url "sticker.jpg" 
   category_id Category.all.sample.id
end