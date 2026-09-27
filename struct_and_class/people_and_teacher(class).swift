// Practice 6.2 — People and Teachers (class)

// 1. Base Class: Person
class Person {
    var name: String
    
    // Classes do not get a free memberwise initializer; we must define init
    init(name: String) {
        self.name = name
    }
    
    func introduce() -> String {
        return "Hi, I'm \(name)."
    }
}

// 2. Subclass: Teacher inherits from Person
class Teacher: Person {
    var subject: String
    
    init(name: String, subject: String) {
        // Initialize child class properties first
        self.subject = subject
        // Call the superclass initializer
        super.init(name: name)
    }
    
    // 3. Override introduce() to add subject details
    override func introduce() -> String {
        return "Hi, I'm \(name) and I teach \(subject)."
    }
}

// 4. Create an instance of Teacher
let teacherA = Teacher(name: "Mr. Sok", subject: "Swift")

// 5. Assign teacherA to teacherB (both point to the exact same reference in memory)
let teacherB = teacherA

// 6. Change teacherB's name
teacherB.name = "Ms. Sophea"

// 7. Print both introductions (both reflect "Ms. Sophea")
print(teacherA.introduce())
print(teacherB.introduce())