import Foundation

// =========================================================================
// MOCK INPUT — lets this run in a web playground with no real keyboard.
// Replace `mockReadLine()` with `readLine()` everywhere to use it for real.
// =========================================================================

var testInputs: [String] = [
    "1", "1001", "Dara", "20", "dara@school.edu",
    "1", "1001", "1002", "Sok", "22", "",
    "6", "1001", "105", "92",
    "6", "1001", "88",
    "6", "1002", "40",
    "2",
    "3", "1001",
    "3", "so",
    "3", "zzz",
    "4", "1002", "Bopha", "", "bopha@school.edu",
    "5", "1002", "n",
    "5", "1002", "y",
    "7",
    "8", "2", "2",
    "9",
    "0"
]
var testIndex = 0

func mockReadLine() -> String? {
    guard testIndex < testInputs.count else { return nil }
    let line = testInputs[testIndex]
    testIndex += 1
    print(line)   // echo the "typed" input so the transcript reads naturally
    return line
}

// =========================================================================
// MODEL
// =========================================================================

struct Student {
    let id: Int
    var name: String
    var age: Int
    var email: String?
    var scores: [Int] = []

    var average: Double? {
        guard !scores.isEmpty else { return nil }
        let total = scores.reduce(0, +)
        return Double(total) / Double(scores.count)
    }

    var grade: String? {
        guard let avg = average else { return nil }
        switch avg {
        case 90...100: return "A"
        case 80..<90:  return "B"
        case 70..<80:  return "C"
        case 50..<70:  return "D"
        default:       return "F"
        }
    }
}

// =========================================================================
// VALIDATION
// =========================================================================

enum ValidationError: Error {
    case invalidID
    case duplicateID(Int)
    case idNotFound(Int)
    case emptyName
    case invalidAge
    case invalidEmail
    case invalidScore

    var message: String {
        switch self {
        case .invalidID:            return "Error: ID must be a whole number greater than 0."
        case .duplicateID(let id):  return "Error: ID \(id) already exists."
        case .idNotFound(let id):   return "Error: Student ID \(id) not found."
        case .emptyName:            return "Error: Name cannot be empty."
        case .invalidAge:           return "Error: Age must be a whole number from 16 to 60."
        case .invalidEmail:         return "Error: Email must contain '@'."
        case .invalidScore:         return "Error: Score must be between 0 and 100."
        }
    }
}

var students: [Int: Student] = [:]

func validateNewID(_ input: String) throws -> Int {
    guard let id = Int(input), id > 0 else { throw ValidationError.invalidID }
    guard students[id] == nil else { throw ValidationError.duplicateID(id) }
    return id
}

func validateExistingID(_ input: String) throws -> Int {
    guard let id = Int(input), id > 0 else { throw ValidationError.invalidID }
    guard students[id] != nil else { throw ValidationError.idNotFound(id) }
    return id
}

func validateName(_ input: String) throws -> String {
    let trimmed = input.trimmingCharacters(in: .whitespaces)
    guard !trimmed.isEmpty else { throw ValidationError.emptyName }
    return trimmed
}

func validateAge(_ input: String) throws -> Int {
    guard let age = Int(input), (16...60).contains(age) else { throw ValidationError.invalidAge }
    return age
}

func validateEmail(_ input: String) throws -> String? {
    let trimmed = input.trimmingCharacters(in: .whitespaces)
    if trimmed.isEmpty { return nil }
    guard trimmed.contains("@") else { throw ValidationError.invalidEmail }
    return trimmed
}

func validateScore(_ input: String) throws -> Int {
    guard let score = Int(input), (0...100).contains(score) else { throw ValidationError.invalidScore }
    return score
}

// =========================================================================
// INPUT HELPERS
// =========================================================================

func prompt<T>(_ label: String, validate: (String) throws -> T) -> T {
    while true {
        print(label, terminator: "")
        let input = mockReadLine() ?? ""
        do {
            return try validate(input)
        } catch let error as ValidationError {
            print(error.message)
        } catch {
            print("Error: invalid input.")
        }
    }
}

func promptUpdate<T>(_ label: String, current: T, display: String, validate: (String) throws -> T) -> T {
    while true {
        print("\(label) [\(display)]: ", terminator: "")
        let input = mockReadLine() ?? ""
        if input.trimmingCharacters(in: .whitespaces).isEmpty {
            return current
        }
        do {
            return try validate(input)
        } catch let error as ValidationError {
            print(error.message)
        } catch {
            print("Error: invalid input.")
        }
    }
}

func pad(_ text: String, _ width: Int) -> String {
    text.count >= width ? text + " " : text + String(repeating: " ", count: width - text.count)
}

func printTable(_ list: [Student]) {
    print(pad("ID", 6) + pad("Name", 10) + pad("Average", 9) + "Grade")
    for s in list {
        let avgStr = s.average != nil ? String(format: "%.2f", s.average!) : "—"
        let gradeStr = s.grade ?? "—"
        print(pad("\(s.id)", 6) + pad(s.name, 10) + pad(avgStr, 9) + gradeStr)
    }
}

// =========================================================================
// FEATURES
// =========================================================================

func addStudent() {
    let id = prompt("Student ID: ") { try validateNewID($0) }
    let name = prompt("Name: ") { try validateName($0) }
    let age = prompt("Age: ") { try validateAge($0) }
    let email = prompt("Email (optional): ") { try validateEmail($0) }
    students[id] = Student(id: id, name: name, age: age, email: email)
    print("Student added.")
}

func viewStudents() {
    if students.isEmpty {
        print("No students yet.")
        return
    }
    printTable(students.values.sorted { $0.id < $1.id })
}

func searchStudent() {
    print("Search by ID or name: ", terminator: "")
    let query = (mockReadLine() ?? "").trimmingCharacters(in: .whitespaces)

    var results: [Student] = []
    if let id = Int(query), let match = students[id] {
        results = [match]
    } else {
        let lowered = query.lowercased()
        results = students.values.filter { $0.name.lowercased().contains(lowered) }
    }

    if results.isEmpty {
        print("Not found.")
    } else {
        printTable(results.sorted { $0.id < $1.id })
    }
}

func updateStudent() {
    let id = prompt("Student ID: ") { try validateExistingID($0) }
    guard var student = students[id] else { return }

    student.name = promptUpdate("Name", current: student.name, display: student.name) {
        try validateName($0)
    }
    student.age = promptUpdate("Age", current: student.age, display: "\(student.age)") {
        try validateAge($0)
    }
    student.email = promptUpdate(
        "Email", current: student.email, display: student.email ?? "not provided"
    ) { try validateEmail($0) }

    students[id] = student
    print("Student updated.")
}

func deleteStudent() {
    let id = prompt("Student ID: ") { try validateExistingID($0) }
    print("Delete student \(id)? (y/n): ", terminator: "")
    let confirm = (mockReadLine() ?? "").lowercased()
    if confirm == "y" {
        students.removeValue(forKey: id)
        print("Student deleted.")
    } else {
        print("Cancelled.")
    }
}

func addScore() {
    let id = prompt("Student ID: ") { try validateExistingID($0) }
    let score = prompt("Score: ") { try validateScore($0) }
    students[id]?.scores.append(score)
    print("Score added.")
}

func classReport() {
    print("===== CLASS REPORT =====")
    print("Total students: \(students.count)")

    let withScores = students.values.filter { $0.average != nil }
    if withScores.isEmpty {
        print("Class average: —")
    } else {
        let total = withScores.reduce(0.0) { $0 + $1.average! }
        print(String(format: "Class average: %.2f", total / Double(withScores.count)))
    }

    let passing = withScores.filter { $0.average! >= 50 }
    let failing = withScores.filter { $0.average! < 50 }
    print("Passing: \(passing.count)  Failing: \(failing.count)")

    if let top = withScores.max(by: { $0.average! < $1.average! }) {
        print("Top student: \(top.name) (\(String(format: "%.2f", top.average!)))")
    }
}

func filterAndSort() {
    var list = Array(students.values)

    print("Filter by: 1) Grade  2) Passing  3) Failing  4) None")
    print("Choose: ", terminator: "")
    switch mockReadLine() ?? "" {
    case "1":
        print("Grade letter (A-F): ", terminator: "")
        let letter = (mockReadLine() ?? "").uppercased()
        list = list.filter { $0.grade == letter }
    case "2":
        list = list.filter { ($0.average ?? -1) >= 50 }
    case "3":
        list = list.filter { if let a = $0.average { return a < 50 } else { return false } }
    default:
        break
    }

    print("Sort by: 1) Name (A-Z)  2) Average (high-low)  3) None")
    print("Choose: ", terminator: "")
    switch mockReadLine() ?? "" {
    case "1":
        list.sort { $0.name.lowercased() < $1.name.lowercased() }
    case "2":
        list.sort { ($0.average ?? -1) > ($1.average ?? -1) }
    default:
        break
    }

    if list.isEmpty {
        print("No students match.")
    } else {
        printTable(list)
    }
}

// =========================================================================
// MAIN LOOP
// =========================================================================

print("===== ACADEMIC MANAGER =====")

mainLoop: while true {
    print("""
    1. Add student
    2. View all students
    3. Search student
    4. Update student
    5. Delete student
    6. Add score
    7. Class report
    8. Filter & sort
    0. Exit
    """)
    print("Choose an option: ", terminator: "")
    let choice = mockReadLine() ?? ""

    switch choice {
    case "1": addStudent()
    case "2": viewStudents()
    case "3": searchStudent()
    case "4": updateStudent()
    case "5": deleteStudent()
    case "6": addScore()
    case "7": classReport()
    case "8": filterAndSort()
    case "0":
        print("Goodbye!")
        break mainLoop
    default:
        print("Invalid option.")
    }
    print("")
}