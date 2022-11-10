puts "bruh"

$globalMoment = 12.4


class Test 
    @@num_instances = 0
    def initialize
        @number = 5
        @@num_instances += 1
    end
    def getNum
        @number
    end

    def numInstances
        puts "num instances: #@@num_instances"
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
test1.numInstances

test1.numInstances

test2 = Test.new
test2.numInstances
test1.numInstances

cust1 = Customer.new(55, "Bob", "123 street");
cust2 = Customer.new(12, "Frank", "456 road");

cust1.printMe
puts
cust2.printMe


a = 10
b = 20

puts "A = #{a}, B = #{b}"
a, b = b, a
puts "A = #{a}, B = #{b}"



inputFile = File.new("testinput.txt", "r")

puts inputFile.gets
puts inputFile.gets

puts

inputFile = File.new("testinput.txt", "r")

puts inputFile.sysread(15)

arr = IO.readlines("testinput.txt");

puts "array:"
puts "index 0: #{arr[0]}"
puts "index 1: #{arr[1]}"
puts "index 2: #{arr[2]}"