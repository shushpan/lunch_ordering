class Api::V1::OrderSerializer < ActiveModel::Serializer
  belongs_to :user, serializer: Api::V1::UserSerializer

  has_many :foods, serializer: FoodSerializer do
    Food.where(date: Date.today)
    end
end
