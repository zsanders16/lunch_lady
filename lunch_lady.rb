require 'pry'
require 'colorize'

require_relative 'customer'
require_relative 'menu'
require_relative 'main_dish'
require_relative 'side_dish'
require_relative 'dishes'
require_relative 'meal'





def welcome(customer, menu)
    
    puts `clear`
    puts "Welcome to the Lunch Lady Cafe \n\n".black.on_red.blink
    puts "Currently we only offer main entrees and side dishes.".colorize(:red)
    puts "Please select as many main entree and sides as you would like. \n\n".colorize(:red)

    display_main(customer, menu)
end

def display_main(customer, menu)

    puts "Please select an option: \n\n".colorize(:red)
    puts "1) Select a main entree"  
    puts "2) Select a side entree"
    puts "3) Display all your items and remove any you don't want"
    puts "4) Checkout"
    puts "5) Quit"

    

    user_response = gets.strip

    case user_response
        when '1'
            select_main_entree(customer, menu)
        when '2'
            select_side_dish(customer, menu)
        when '3'
            display_all_items(customer, menu)
        when '4'
            checkout(customer)
        when '5'
            puts `clear`
            puts "Goodbye, come again."
            sleep(2)
            puts `clear`
        else
            
    end
    
end

def select_main_entree(customer, menu)
    
    puts `clear`
    puts "Please select the main entree you want".colorize(:red)

    menu.dishes.return_entrees.each_with_index { |entree, index| puts "#{index.to_i + 1}) #{entree.name} ($#{entree.cost})"}

    answer = gets.strip

    if validate_main?(answer, menu.dishes.return_entrees)
        customer.meal.add_item(menu.dishes.return_entrees[answer.to_i - 1])

        puts `clear`
        display_main(customer, menu)
    else
        puts "Invalid answer, try again" 
        select_main_entree
    end
        
    
end

def select_side_dish(customer, menu)
    
    puts `clear`
    puts "Please select the main entree you want".colorize(:red)

    menu.dishes.return_sides.each_with_index { |side, index| puts "#{index.to_i + 1}) #{side.name} ($#{side.cost})"}

    answer = gets.strip

    if validate_main?(answer, menu.dishes.return_sides)
        customer.meal.add_item(menu.dishes.return_sides[answer.to_i - 1])

        puts `clear`
        display_main(customer, menu)
    else
        puts "Invalid answer, try again" 
        select_main_entree
    end
end

def validate_main?(str, array)
    str =~ /[1-#{array.length}]/
end


def display_all_items(customer, menu)
    
    puts "Your current items that you have ordered."
    customer.meal.items.each_with_index { |item, index| puts "#{index.to_i + 1}) #{item.name} ($#{item.cost})"}

    puts "\n\n Select the number of item you would like to remove or 'q' to back to the main menu"

    answer = gets.strip


    if validate_main?(answer, customer.meal.items)
        customer.meal.items.delete_at(answer.to_i - 1)

        
        puts `clear`
        puts "Your item was removed."
        display_main(customer, menu)
    elsif answer == 'q'
        puts `clear`
        display_main(customer, menu)
    else
        puts "Invalid answer, try again" 
        select_main_entree
    end
end

def checkout(customer)
    puts "Your current items that you have ordered."
    customer.meal.items.each_with_index { |item, index| puts "#{index.to_i + 1}) #{item.name} ($#{item.cost})"}

    puts "Your total cost is: $#{customer.meal.calculate_cost}"

    puts "Thank you for your payment,  Goodbye, Come Again."
end
                
available_dishes = [
                Main_dish.new( { name: 'Meat Loaf',         cost: 5.00 } ),
                Main_dish.new( { name: 'Mystery Meat',      cost: 4.50 } ),
                Main_dish.new( { name: 'Slop',              cost: 3.00 } ),

                Side_dish.new( { name: 'Fries',             cost: 1.95 } ),
                Side_dish.new( { name: 'Mac and Cheese',    cost: 2.50 } ),
                Side_dish.new( { name: 'Carrots',           cost: 0.95 } ),
                Side_dish.new( { name: 'Grapes',            cost: 1.25 } ),
                Side_dish.new( { name: 'Apple',             cost: 0.95 } )
                ]

dishes = Dishes.new(available_dishes)

menu = Menu.new(dishes)
customer = Customer.new( { meal: Meal.new } )


welcome(customer, menu)