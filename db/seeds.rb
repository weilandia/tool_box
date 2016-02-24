50.times do
  name = Faker::Name.first_name
  user = User.create(name: name, username: name, password: name)

  user.tools.create(name: Faker::Hipster.word, price: Faker::Number.number(2).to_i, quantity: Faker::Number.number(2).to_i, user_id: user.id)

  user.tools.create(name: Faker::Hipster.word, price: Faker::Number.number(2).to_i, quantity: Faker::Number.number(2).to_i, user_id: user.id)

  user.tools.create(name: Faker::Hipster.word, price: Faker::Number.number(2).to_i, quantity: Faker::Number.number(2).to_i, user_id: user.id)

  user.tools.create(name: Faker::Hipster.word, price: Faker::Number.number(2).to_i, quantity: Faker::Number.number(2).to_i, user_id: user.id)

  user.tools.create(name: Faker::Hipster.word, price: Faker::Number.number(2).to_i, quantity: Faker::Number.number(2).to_i, user_id: user.id)
end
