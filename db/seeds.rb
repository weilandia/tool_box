50.times do
  Tool.create(name: Faker::Hipster.word, price: Faker::Number.number(4).to_i, quantity: Faker::Number.number(4).to_i)
end
