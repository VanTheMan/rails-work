Fabricator(:user) do
  email { Faker::Internet.email }
  name { Faker::Name.name }
  password "123456a@"
  password_confirmation "123456a@"
end