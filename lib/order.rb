require_relative 'menu'
require_relative 'text'
require_relative 'takeaway'

require 'rubygems'
#require 'twilio-ruby'

class Order

include Text, Menu
attr_accessor :order_list, :takeaway, :menu_choice, :menu_selection

def initialize
  @takeaway = Takeaway.new
  @menu_selection = takeaway.menu_selection
end

def total_price
  @takeaway.menu_selection
end


# def total_price
#   menu_prices
#   @overall_price = @unit_prices.inject(0) {|sum, i|  sum + i }
# end
#
# def menu_prices
#   @unit_prices = []
#   @menu_choice.each{|item, quantity| @unit_prices << MENU[item] * quantity.to_f}
#   @unit_prices
# end

# def confirm_order
#   @takeaway.total_price
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
