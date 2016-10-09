require_relative 'menu'
require_relative 'order'
require_relative 'text'

require 'rubygems'
#require 'twilio-ruby'

class Takeaway

include Text, Menu
attr_accessor :menu_choice, :quantity_total, :total_count

  def initialize
    @menu_choice = {}
    @quantity_total = []
    @total_count = 0
  end

  def select_item
    while @item != "exit" do
      puts "Please type in your order or 'exit' to finish."
      @item = gets.chomp
      return if @item == "exit"
      puts "How many portions would you like?"
      @quantity = gets.chomp.to_i
      @quantity_total << @quantity
      add_items(@item, @quantity)
    end
  end

  def add_items(item, quantity)
    fail "Ooops, that item is not available" unless MENU.include?(item)
    @menu_choice[item] = quantity
    puts "Item added"
  end

  def order_count
    @total_count = @menu_choice.values.inject(:+)
  end

  def total_price
    menu_prices
    @overall_price = @unit_prices.inject(0) {|sum, i|  sum + i }
  end

  def menu_prices
    @unit_prices = []
    @menu_choice.each{|item, quantity| @unit_prices << MENU[item] * quantity.to_f}
    @unit_prices
  end

  def menu_selection
    total_price
  end

  # def confirm_order
  #   total_price
  #   puts "The items ordered are #{@menu_choice}\n"
  #   puts "The overall price is £#{@overall_price}0 \n"
  #   puts "Enter 'yes' if you are happy to proceed"
  #   answer = gets.chomp
  #   (answer == "yes" || answer == "Yes") ? payment : return
  # end
  #
  # def payment
  #   puts "Please check and confirm the payment amount:"
  #   payment = gets.chomp
  #     if payment.to_f == @overall_price
  #       p "send_text"
  #     else puts "Ooops, something has gone wrong. Please enter the correct amount:"
  #       confirm_order
  #     end
  # end
end
