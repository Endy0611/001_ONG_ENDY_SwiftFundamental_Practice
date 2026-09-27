struct Student {
    let name: String
    // 1. Mark email as optional with '?' (it can hold a String or nil)
    let email: String?
}

// 2. Sample data: Dara has an email, Sok has none (nil)
let students = [
    Student(name: "Dara", email: "dara@school.edu"),
    Student(name: "Sok", email: nil)
]

// 3. For each student, unwrap safely with 'if let' or show fallback text
for student in students {
    if let email = student.email {
        print("\(student.name): \(email)")
    } else {
        print("\(student.name): no email on file")
    }
}

// 4. Nil-Coalescing Operator (??): provides a default value when nil
let sokContact = students[1].email ?? "not provided"
print("Sok's contact: \(sokContact)")

// 5. Optional Chaining (?.) to get the length safely in one expression
if let length = students[0].email?.count {
    print("Dara's email length: \(length)")
}

// 6. Early exit using 'guard let'
func sendReminder(to student: Student) {
    guard let email = student.email else {
        print("Cannot remind \(student.name): missing email.")
        return
    }
    print("Reminder sent to \(email).")
}

sendReminder(to: students[0])
sendReminder(to: students[1])