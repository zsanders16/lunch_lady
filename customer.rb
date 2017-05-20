

class Customer
    attr_reader :meal
    
    def initialize(args)
        @meal = args[:meal]
    end
end