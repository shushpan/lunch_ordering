class Api::V1::OrderSerializer < ActiveModel::Serializer
  belongs_to  :user
  has_many    :foods
  attributes   :id, :total_amount
end
