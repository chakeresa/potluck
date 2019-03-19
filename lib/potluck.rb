require './lib/dish'

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
    menu_generator
    @dishes
  end

  def get_all_from_category(category)
    @dishes.select do |dish|
      dish.category == category
    end
  end

  # move to a new class?
  def menu_generator
    @menu = Hash.new([])

    # move to another method
    @dishes.each do |dish|

      key = add_s(dish.category)

      if !@menu.has_key?(key)
        @menu[key] = []
      end

      @menu[key] << dish.name
    end

    # move to another method
    @menu.each_key do |category|
      @menu[category].sort!
    end

  end

  def add_s(symbol)
    (symbol.to_s + "s").to_sym
  end

end
