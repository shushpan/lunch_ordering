module Admin::OrdersHelper

  def find_user_by_id id
    User.find(id)
  end

  def find_food_by_id_and_type id, type
    Food.where('id = ? and food_type = ?',id,type)
  end
end
