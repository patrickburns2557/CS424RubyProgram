#!/usr/bin/ruby

#Class for a student that contains an ID and a Name
class Student
    def initialize(id, name)
        @id = id
        @name = name
    end

    def getID
        @id
    end

    def getName
        @name
    end
end


#Class for a course that contains a CRN code and a course name
class Course
    def initialize(crn, courseName)
        @crn = crn
        @courseName = courseName
    end

    def getCRN
        @crn
    end

    def getCourseName
        @courseName
    end
end


#Class to represent a student enrolled ina course that contains
#the student ID and the CRN of the course they are enrolled in
class Seat
    def initialize(studentID, courseCRN)
        @studentID = studentID
        @courseCRN = courseCRN
    end

    def getStudentID
        @studentID
    end

    def getCourseCRN
        @courseCRN
    end
end

#Function splits the input line into 2 pieces at the first occurence of a space
#and then converts all whitespace into a single space and gets rid of all
#leading and trailing whitespace.
#RETURN: a 2 element array containing the 2 split pieces
def splitLines (inputLine)
    split = inputLine.split(" ", 2)
    split[0] = split[0].to_s.gsub(/\s+/, ' ')
    split[0] = split[0].to_s.strip
    split[1] = split[1].to_s.gsub(/\s+/, ' ')
    split[1] = split[1].to_s.strip
    split
end

######################################################################

studentArray = []
courseArray = []
seatArray = []

inputFile = File.open("register.txt", "r")

puts "======================================\nReading in Data.\n\n"

#Read in students, stop at the empty line
currentLine = inputFile.gets
while currentLine != "\n"
    split = splitLines(currentLine)

    student = Student.new(split[0], split[1])
    studentArray.append(student)

    currentLine = inputFile.gets
end


#Read in courses, stop at the empty line
currentLine = inputFile.gets
while currentLine != "\n"
    split = splitLines(currentLine)

    course = Course.new(split[0], split[1])
    courseArray.append(course)

    currentLine = inputFile.gets
end

#Read in seats, stop when end of file reached
currentLine = inputFile.gets
while currentLine != nil
    split = splitLines(currentLine)
    
    #Check if the student with the given ID is enrolled
    foundS = false
    studentArray.find { |s| 
        if s.getID == split[0]
            foundS = true
            break
        end
    }
    if !foundS
        print "Student with ID \"", split[0], "\" is not enrolled.\n"
    end

    #Check if the course with the given CRN exists or not
    foundC = false
    courseArray.find { |c|
        if c.getCRN == split[1]
            foundC = true
            break
        end
    }
    if !foundC
        print "Course with CRN \"", split[1], "\" does not exist.\n"
    end

    #If either the student or the course doesn't exist, don't create the Seat object
    if !(foundS and foundC)
        currentLine = inputFile.gets
        next
    end
    
    seat = Seat.new(split[0], split[1])
    seatArray.append(seat)

    currentLine = inputFile.gets
end

inputFile.close

print "\nData read finished.\n======================================\n\n\n"

print "STUDENTS:\n======================================\n"

#Print out each student and the classes they're enrolled in
studentArray.each do |student|
    courseCounter = 0
    print "Student: ", student.getName, "\n"
    puts "Courses enrolled in:"
    seatArray.each do |seat| #find which classes the student is enrolled in
        if seat.getStudentID == student.getID
            courseCounter += 1

            #find which course name matches the found Course CRN in the seat
            course = courseArray.find { |c| c.getCRN == seat.getCourseCRN}
            print "[", courseCounter, "] ", course.getCourseName, "\n"
        end
    end
    print "\n\n"
end

print "\n\n"

print "COURSES:\n======================================\n"

#Print out each class and the students enrolled in it
courseArray.each do |course|
    studentCounter = 0
    print "Course: ", course.getCourseName, "\n"
    puts "Students enrolled:"
    seatArray.each do |seat| #find which students are enrolled in the class
        if seat.getCourseCRN == course.getCRN
            studentCounter += 1
            
            #find which student name matches the found Student ID in the seat
            student = studentArray.find { |s| s.getID == seat.getStudentID}
            print "[", studentCounter, "] ", student.getName, "\n"
        end
    end
    print "\n\n"
end