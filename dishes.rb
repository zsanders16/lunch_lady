

class Dishes
    attr_reader :dishes
    
    def initialize(dishes)
        @dishes = dishes
    end

    def return_entrees
        @dishes.select { |dish| dish.class == Main_dish}
    end
    
    def return_sides
        @dishes.select { |dish| dish.class == Side_dish}
    end
    
    
end