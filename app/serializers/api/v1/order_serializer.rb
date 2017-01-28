class Api::V1::OrderSerializer < ActiveModel::Serializer
  belongs_to :user, serializer: UserSerializer
  attribute :id
  attribute :first_course_id, key: :first_course do
    get_food_by_id(object.first_course_id)
  end
  attribute :main_course_id, key: :main_course do
    get_food_by_id(object.main_course_id)
  end
  attribute :drink_id, key: :drink do
    get_food_by_id(object.drink_id)
  end
  attribute :total_amount
  def get_food_by_id id
    unless id.zero?
     food = Food.find(id)
      {name: food.name, photo: food.photo.url, price: food.price}
    end
  end
end
