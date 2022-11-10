
fileInArray = IO.readlines("register.txt")


#TESTING SPLITTING THE INPUT INTO THE NEEDED PARTS
arrayTest = []

fileInArray.each do |i|
    arrayTest.append(i.split(" ", 2))
end

arrayTest.each do |i|
    puts i
end






class Student
    def initialize(id, name)
        @id = id
        @name = name
    end

    def printMe
        print "ID: "
        print @id
        print "  Name: "
        print @name
        puts
    end

    def getID
        @id
    end

    def getName
        @name
    end
end



class Course
    def initialize(crn, courseName)
        @crn = crn
        @courseName = courseName
    end

    def printMe
        print "CRN: "
        print @crn
        print "  Name: "
        print @courseName
        puts
    end

    def getCRN
        @crn
    end

    def getCourseName
        @courseName
    end
end



class Seat
    def initialize(studentID, courseCRN)
        @studentID = studentID
        @courseCRN = courseCRN
    end
end

puts "=================="

student1 = Student.new(5555, "bob")

student2 = Student.new(4444, "jack three")

course1 = Course.new("123", "math");

course2 = Course.new("222", "physics seventeen eighty three")


student1.printMe
student2.printMe
course1.printMe
course2.printMe


puts "student 1 name: #{student1.getName} student 1 id: #{student1.getID}"
puts "student 2 name: #{student2.getName} student 2 id: #{student2.getID}"