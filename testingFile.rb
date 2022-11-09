puts "bruh"



class Test 
    @@num_instances
    def initialize
        @number = 5
    end
    def getNum
        @number
    end
end

class Customer
    @@numCustomers = 0
    def initialize(id, name, address)
        @id = id
        @name = name
        @address = address
    end
    def printMe
        puts @id
        puts @name
        puts @address
    end
end

test1 = Test.new

print "test1 number = "
puts test1.getNum

cust1 = Customer.new(55, "Bob", "123 street");
cust2 = Customer.new(12, "Frank", "456 road");

cust1.printMe
puts
cust2.printMe