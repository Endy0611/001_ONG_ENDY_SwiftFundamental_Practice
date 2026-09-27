// 1. Raw scores to scan
let rawScores = [78, 92, -5, 64, 101, 88, -1, 70]

// 2. Tracking counters
var validCount = 0
var total = 0

// 3. Loop through scores with break and continue
for score in rawScores {
    // Stop immediately if end marker (-1) is reached
    if score == -1 {
        print("End marker found. Stopping.")
        break
    }
    
    // Skip invalid scores (not between 0 and 100)
    if score < 0 || score > 100 {
        print("\(score) skipped (invalid)")
        continue
    }
    
    // Process valid score
    print("\(score) accepted")
    validCount += 1
    total += score
}

// 4. Print summary
print("Valid scores: \(validCount)")
print("Total: \(total)")