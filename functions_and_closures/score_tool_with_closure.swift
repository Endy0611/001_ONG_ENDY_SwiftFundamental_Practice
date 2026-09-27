let scores = [72, 45, 90, 61, 38, 85]

// 1. Keep scores greater than 50 using filter and shorthand $0
let passingScores = scores.filter { $0 > 50 }
print("Passing: \(passingScores)")

// 2. Add 5 points to every score using map
let bonusScores = scores.map { $0 + 5 }
print("Add 5 bonus points to every score: \(bonusScores)")

// 3. Sort highest to lowest using sorted(by:)
let sortedScores = scores.sorted { $0 > $1 }
print("Sort Highest first: \(sortedScores)")

// 4. Store a rule in a constant with full closure syntax
let isPassing: (Int) -> Bool = { (score: Int) -> Bool in
    return score > 50
}

// 5. Use the stored rule to count passing scores
let passingCount = scores.filter(isPassing).count
print("Passing count: \(passingCount)")