require 'faker'

# user = User.create ....
users = 10.times.map do
  password = Faker::Internet.password(8)
  User.create!(
    username: Faker::Internet.user_name,
    password: password,
    password_confirmation: password
  )
end

50.times do
  Snake.create(
    name: Faker::Name.name,
    species: Faker::Hipster.words(2).join(' '),
    owner: users.sample,
    keeper: users.sample
  )
end
