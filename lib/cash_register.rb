require 'pry'

class CashRegister

    attr_reader :items
    attr_accessor :total, :discount

    def initialize(discount = 0)
        @total = 0.0
        @discount = discount
        @items = []
        @last_item = 0
    end

    def add_item(title, price, quantity = 1)
        @total += price*quantity
        @last_item = price * quantity
        quantity.times do @items << title end
    end

    def apply_discount
        if @discount == 0
            return "There is no discount to apply."
        else
            @total -= (@total * (@discount/100.0))
            return "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def void_last_transaction
        @total -= @last_item
        @last_item = 0
        # @items.pop()

        if @items.length ==0
            @total = 0.0
        end
    end

end
