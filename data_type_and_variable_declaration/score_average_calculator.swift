let score1 = 80
let score2 = 90
let score3 = 85

// 1. Calculate total
let total = score1 + score2 + score3

// 2. Average as decimal (convert total to Double so division keeps decimals)
let average = Double(total) / 3.0

// 3. Round down by converting Double to Int
let roundedAverage = Int(average)

// 4. Build label with '+' by converting the number to a String
let label = "Total: " + String(total)

// 5. Print results
print("Total: \(total)")
print("Average: \(average)")
print("Rounded average: \(roundedAverage)")
print("Label -> \(label)")