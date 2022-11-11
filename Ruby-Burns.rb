
fileInputArray = IO.readlines("register.txt")

splitEntries = []

#split each line into the 2 parts from the first space
#this will create an array of arrays, witch each inner array containing 2 entries
fileInputArray.each do |i|
    splitEntries.append(i.split(" ", 2))
end

#convert all whitespace into a single space by searching for whitespace 
#with regex and replacing all matches with a single space
splitEntries.each do |i|
    i[0] = i[0].to_s.gsub(/\s+/, ' ')
    i[0] = i[0].to_s.strip
    i[1] = i[1].to_s.gsub(/\s+/, ' ')
    i[1] = i[1].to_s.strip
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

    def getStudentID
        @studentID
    end

    def getCourseCRN
        @courseCRN
    end
end



studentArray = []
courseArray = []
seatArray = []

finishedStudents = false
finishedCourses = false

#loop through the array containing all the information from the file
splitEntries.each do |first, second|
    #if we're still in the students section
    if !finishedStudents and !finishedCourses
        #check to see if we've reached the blank line, if we have change boolean value
        #to indicate students are finished and continue to next loop iteration
        if first == ""
            finishedStudents = true
            next
        end

        student = Student.new(first, second)
        studentArray.append(student)

    elsif finishedStudents and !finishedCourses
        #if we've reached a blank line, courses section is finished
        if first == ""
            finishedCourses = true
            next
        end
        course = Course.new(first, second)
        courseArray.append(course)

    else
        seat = Seat.new(first, second)
        seatArray.append(seat)
    end
end


puts "Student array:"
studentArray.each do |i|
    print "\"", i.getID, "\"  ", "\"", i.getName, "\"", "\n"
end
puts "========="
puts
puts "Course array:"
courseArray.each do |i|
    print "\"", i.getCRN, "\"  ", "\"", i.getCourseName, "\"", "\n"
end
puts "========="
puts
puts "Seat array:"
seatArray.each do |i|
    print "\"", i.getStudentID, "\"  ", "\"", i.getCourseCRN, "\"" "\n"
end
puts "=========\n\n\n\n\n\n"



studentArray.each do |student| #test each student
    courseCounter = 0
    print "Student: ", student.getName, "\n"
    puts "Courses enrolled in:"
    seatArray.each do |seat| #find which classes the student is enrolled in
        if seat.getStudentID == student.getID
            courseCounter += 1
            courseArray.each do |course| #find which course name matches the found course CRN
                if course.getCRN == seat.getCourseCRN
                    print "[", courseCounter, "] ", course.getCourseName, "\n"
                end
            end
        end
    end
    print "\n\n"
end

print "\n\n\n\n"

courseArray.each do |course|
    studentCounter = 0
    print "Course: ", course.getCourseName, "\n"
    puts "Students enrolled:"
    seatArray.each do |seat|
        if seat.getCourseCRN == course.getCRN
            studentCounter += 1
            studentArray.each do |student|
                if student.getID == seat.getStudentID
                    print "[", studentCounter, "] ", student.getName, "\n"
                end
            end
        end
    end
    print "\n\n"
end