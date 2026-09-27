// 1. Calculate average score
func average(of scores: [Int]) -> Double {
    var sum = 0
    for score in scores {
        sum += score
    }
    return Double(sum) / Double(scores.count)
}

// 2. Convert average to letter grade
func letterGrade(for avg: Double) -> String {
    if avg >= 90 {
        return "A"
    } else if avg >= 80 {
        return "B"
    } else if avg >= 70 {
        return "C"
    } else if avg >= 50 {
        return "D"
    } else {
        return "F"
    }
}

// 3. '_' removes the external name label for the first parameter
func printReport(_ name: String, scores: [Int]) {
    let avg = average(of: scores)
    let grade = letterGrade(for: avg)
    print("\(name): average \(avg), grade \(grade)")
}

// Test calls
printReport("Dara", scores: [80, 90, 85])
printReport("Sok", scores: [60, 70, 65])