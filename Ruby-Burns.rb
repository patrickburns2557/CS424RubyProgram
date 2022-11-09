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
end

student1 = Student.new(5555, "bob")

student2 = Student.new(4444, "jack three")

course1 = Course.new("123", "math");

course2 = Course.new("222", "physics seventeen eighty three")


student1.printMe
student2.printMe
course1.printMe
course2.printMe