let score = 82
let attendance = 95
let gpa = 3.6

// 1. Determine grade using if / else if
var grade = ""
if score >= 90 {
    grade = "A"
} else if score >= 80 {
    grade = "B"
} else if score >= 70 {
    grade = "C"
} else if score >= 50 {
    grade = "D"
} else {
    grade = "F"
}

// 2. Determine Pass or Fail
var result = ""
if score >= 50 {
    result = "Pass"
} else {
    result = "Fail"
}

// 3. Match message based on grade using switch
var message = ""
switch grade {
case "A":
    message = "Excellent!"
case "B", "C":
    message = "Good work, keep going!"
case "D":
    message = "You passed. Aim higher next time."
case "F":
    message = "Please see your instructor."
default:
    message = ""
}

// 4. Scholarship eligibility (both conditions must be true: &&)
var scholarship = ""
if gpa >= 3.5 && attendance >= 90 {
    scholarship = "Eligible"
} else {
    scholarship = "Not eligible"
}

// 5. Warning check (at risk if either is true: ||)
var warning = ""
if attendance < 75 || score < 50 {
    warning = "At risk"
} else {
    warning = "None"
}

// 6. Print all results
print("Score: \(score)")
print("Grade: \(grade)")
print("Result: \(result)")
print("Message: \(message)")
print("Scholarship: \(scholarship)")
print("Warning: \(warning)")