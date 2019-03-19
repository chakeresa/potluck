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

end
