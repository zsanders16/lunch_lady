
class Main_dish
    attr_reader :name, :cost

    def initialize(args)
        @name = args[:name]
        @cost = args[:cost]
    end


end