module FoodHelper
  def days_of_the_current_week
    today = Date.today
    (today.at_beginning_of_week..today.at_end_of_week).map do |day|
      day = { :day => day.strftime("%d"),
              :month => day.strftime("%b"),
              :weekday => day.strftime("%a"),
              :full_date => day,
              :later_today => day > today ? true : false }
    end
  end

  def get_food_by_course(course)
    @foods.where(food_type: course)
  end
end
