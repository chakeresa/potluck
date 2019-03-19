require './lib/dish'
require './lib/potluck'

class MenuGenerator
  attr_reader :menu

  def initialize(potluck)
    @potluck = potluck
    @menu = Hash.new([])
    menu_generator
  end

  def menu_generator
    create_keys
    create_values
  end

  def create_keys
    @potluck.dishes.each do |dish|
      key = add_s(dish.category)

      if !@menu.has_key?(key)
        @menu[key] = []
      end

      @menu[key] << dish.name
    end
  end

  def add_s(symbol)
    (symbol.to_s + "s").to_sym
  end

  def create_values
    @menu.each_key do |category|
      @menu[category].sort!
    end
  end
end
