


class Meal
    attr_reader :items

    def initialize
        @items = []
    end    

    def add_item(item)
       items << item 
    end

    def calculate_cost
        items.inject(0) { |sum, item| sum + item.cost  }
    end
    
end