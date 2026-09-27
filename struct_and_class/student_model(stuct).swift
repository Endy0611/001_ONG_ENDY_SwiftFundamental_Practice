// Practice 6.1 — Student Model (struct)

struct Student {
    // 1. Properties: id cannot change ('let'), name and gpa can ('var')
    let id: Int
    var name: String
    var gpa: Double
    
    // 2. Method returning student summary string
    func summary() -> String {
        return "\(id) - \(name) (GPA \(gpa))"
    }
    
    // 3. Methods that modify properties inside a struct require 'mutating'
    mutating func updateGPA(to newGPA: Double) {
        gpa = newGPA
    }
}

// 4. Create original student (using the automatic memberwise initializer)
let original = Student(id: 1001, name: "Dara", gpa: 3.75)

// 5. Make a copy (structs are copied by value)
var copy = original

// 6. Update only the copy's GPA
copy.updateGPA(to: 3.90)

// 7. Print both summaries
print("Original: \(original.summary())")
print("Copy: \(copy.summary())")