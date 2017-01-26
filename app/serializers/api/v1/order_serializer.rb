class Api::V1::OrderSerializer < ActiveModel::Serializer
  belongs_to :user, serializer: UserSerializer

  attributes :first_course, key: :first_course
  attributes :main_course, key: :main_course
  attributes :drink, key: :drink

  def get_food_by_id id
    unless id.zero?
      food = Food.find(id)
      { name: food.name, photo: food.photo.path, price: food.price}
    end
  end

  def first_course
    get_food_by_id(object.first_course_id)
  end

  def main_course
    get_food_by_id(object.main_course_id)
  end

  def drink
    get_food_by_id(object.main_course_id)
  end
end
