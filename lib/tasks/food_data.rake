namespace :db do
  desc "Fill Food table with simple data"
  task food_data: :environment do
    10.times do |n|
      name = Faker::Food.ingredient
      description = Faker::Lorem.paragraphs
      price = Faker::Commerce.price
      date = Date.today
      food_type = ["first-course", "main-course", "drinks"]
      photo = '/public/food.png'
      Food.create!( name: name,
                    description: description,
                    price: price,
                    date: date,
                    food_type: food_type[rand(2)],
                    photo: photo)
    end
  end
end
