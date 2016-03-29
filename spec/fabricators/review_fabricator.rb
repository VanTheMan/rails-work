Fabricator(:review) do
    content { Faker::Lorem.sentence(1) }
    stars { rand(1..5) }
end