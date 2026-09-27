// A struct to represent one course.
// Using `let` for fields that never change, and `var` for the roster which does.
struct Course {
    let code: String
    let title: String
    let capacity: Int
    var enrolledStudents: [String] = []
}

// Dictionary keyed by course code, so we can look up a course directly by its code.
var courses = [
    "SWE101": Course(code: "SWE101", title: "Swift Fundamentals", capacity: 2),
    "UX110": Course(code: "UX110", title: "Intro to UX", capacity: 30)
]

// Returns an optional Course, because the code might not exist.
// The caller must safely unwrap it (e.g. with `if let`).
func findCourse(code: String) -> Course? {
    return courses[code]
}

// Handles one enrollment request and prints the correct outcome message.
func enroll(student: String, in code: String) {

    // Try to find the course. If it doesn't exist, reject and stop here.
    guard var course = courses[code] else {
        print("Rejected \(student): \(code) does not exist")
        return
    }

    // Reject if this student is already enrolled in this course.
    if course.enrolledStudents.contains(student) {
        print("Skipped: \(student) is already enrolled")
        return
    }

    // Reject if the course has no free seats left.
    if course.enrolledStudents.count >= course.capacity {
        print("Rejected \(student): \(code) is full")
        return
    }

    // All checks passed: enroll the student.
    course.enrolledStudents.append(student)

    // Course is a struct (value type), so we must save the updated copy
    // back into the dictionary, or the change would be lost.
    courses[code] = course
    print("Enrolled \(student) in \(code)")
}

// The enrollment requests, in the exact order they should be processed.
let requests = [
    ("Dara", "SWE101"),
    ("Sok", "SWE101"),
    ("Dara", "SWE101"),
    ("Bopha", "SWE101"),
    ("Rithy", "CS999")
]

// Process every request in order. Each call to enroll() handles its own
// success/failure message, and the loop always continues to the next request.
for (student, code) in requests {
    enroll(student: student, in: code)
}

// Print the final roster and seats left for SWE101.
if let swe101 = findCourse(code: "SWE101") {

    // Sort names alphabetically, then join them into one printable string.
    let roster = swe101.enrolledStudents.sorted().joined(separator: ", ")
    print("\n\(swe101.title): \(roster)")

    // Seats left is calculated on the spot, never stored as its own variable.
    print("Seats left: \(swe101.capacity - swe101.enrolledStudents.count)")
}