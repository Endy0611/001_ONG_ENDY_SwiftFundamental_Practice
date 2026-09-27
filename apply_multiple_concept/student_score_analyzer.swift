import Foundation

// 1. Model for student data
struct Student {
    let name: String
    let score: Int
}

// 2. Store multiple students with their scores
let students: [Student] = [
    Student(name: "Dara", score: 88),
    Student(name: "Sok", score: 45),
    Student(name: "Bopha", score: 92),
    Student(name: "Rithy", score: 67),
    Student(name: "Vicheka", score: 73),
    Student(name: "Sophea", score: 39)
]

print("===== SCORE ANALYZER =====")
print("Students: \(students.count)")

// 3. Handle empty list safely (no crash)
guard !students.isEmpty else {
    print("No student data available.")
    exit(0)
}

// 4. Calculate class average (2 decimal places)
let totalScore = students.reduce(0) { $0 + $1.score }
let average = Double(totalScore) / Double(students.count)
print("Class average: \(String(format: "%.2f", average))")

// 5. Show PASS / FAIL for each student (pass = 50+)
print("\n--- Results ---")
for student in students {
    let status = student.score >= 50 ? "PASS" : "FAIL"
    print("\(student.name): \(student.score) \(status)")
}

// 6. Find highest and lowest scores safely
if let highest = students.max(by: { $0.score < $1.score }),
   let lowest = students.min(by: { $0.score < $1.score }) {
    print("\nHighest: \(highest.name) (\(highest.score))")
    print("Lowest: \(lowest.name) (\(lowest.score))")
}

// 7. List only passing students
let passingStudents = students.filter { $0.score >= 50 }.map { $0.name }
print("\nPassing: \(passingStudents.joined(separator: ", "))")

// 8. Rank all students from highest to lowest
let rankedStudents = students.sorted { $0.score > $1.score }
print("\n--- Ranking ---")
for (index, student) in rankedStudents.enumerated() {
    print("\(index + 1). \(student.name) - \(student.score)")
}