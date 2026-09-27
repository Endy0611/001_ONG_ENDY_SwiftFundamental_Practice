// 1. Start with initial key-value pairs
var gradeBook: [String: Int] = ["Dara": 88, "Sok": 74]

// 2. Add new student
gradeBook["Bopha"] = 91

// 3. Update existing score
gradeBook["Sok"] = 79

// 4. Remove a student
gradeBook.removeValue(forKey: "Dara")

// 5. Look up values with a default fallback if not found
let bophaScore = gradeBook["Bopha", default: 0]
let rithyScore = gradeBook["Rithy", default: 0]

print("Bopha: \(bophaScore)")
print("Rithy: \(rithyScore)")

// 6. Count and loop through all entries
print("Entries: \(gradeBook.count)")
for (name, score) in gradeBook {
    print("\(name) -> \(score)")
}