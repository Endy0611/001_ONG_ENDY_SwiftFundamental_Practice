// 1. studentID cannot change, so we use 'let'
let studentID = 1001

// 2. Variables that can change use 'var'
var name = "Dara"
var isActive = true

// 3. Write explicit types using a colon (: Int, : Double)
var age: Int = 20
var gpa: Double = 3.75

// 4. Print the profile
print("===== STUDENT PROFILE =====")
print("")
print("ID: \(studentID)")
print("Name: \(name)")
print("Age: \(age)")
print("GPA: \(gpa)")
print("Active: \(isActive)")

// 5. Update GPA to 3.90 and print again
gpa = 3.90
print("Updated GPA: \(gpa)")