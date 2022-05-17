

class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction
    
    def initialize(discount = 0)
        @total = 0
        @discount = discount #initialize discount and add the optional argument to default 0
        @items = []
    end

    def add_item(title, price, quantity = 1) #accepts a title argument and a price, and optional quantity set to 0
        self.last_transaction = price * quantity #last_transaction will keep track of current transaction
        self.total += self.last_transaction #total will keep track of all transactions. Need to put into accessor
        quantity.times do #for however many quantity (in argument), store the title of the book within items array []
            self.items << title
        end   
    end

    def apply_discount
        if self.discount != 0
            discount_percent = (100.0 - self.discount.to_f) / 100
            self.total = (self.total * discount_percent).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end


    def void_last_transaction
        self.total -= self.last_transaction
    end

end
