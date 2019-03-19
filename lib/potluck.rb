require './lib/dish'
require './lib/menu_generator'

class Potluck
  attr_reader :date,
              :dishes,
              :menu

  def initialize(date)
    @date = date
    @dishes = []
    @menu = Hash.new([])
  end

  def add_dish(dish)
    @dishes << dish
    menu_generator = MenuGenerator.new(self)
    @menu = menu_generator.menu
    @dishes
  end

  def get_all_from_category(category)
    @dishes.select do |dish|
      dish.category == category
    end
  end

  def ratio(category)
    category_list = @dishes.map do |dish|
      dish.category
    end

    number_in_category =  category_list.count(category)
    percent = number_in_category.to_f / category_list.length * 100
    percent.round(1)
  end

end
