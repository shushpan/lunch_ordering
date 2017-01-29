class Api::V1::FoodSerializer < ActiveModel::Serializer
  attribute :food_type
  attribute :name
  attribute :price
  attribute :photo
end