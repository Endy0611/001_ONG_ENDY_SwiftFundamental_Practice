// 1. Set up variables to track total minutes and session count
var totalMinutes = 0
var sessionCount = 0

// 2. while loop: keeps running as long as totalMinutes is under 100
while totalMinutes < 100 {
    sessionCount += 1
    totalMinutes += 25
    print("Session \(sessionCount): \(totalMinutes) minutes")
}

print("Goal reached in \(sessionCount) sessions.")

// 3. repeat-while loop: runs the block first, checks condition at the end
var countdown = 3

repeat {
    print("\(countdown)...")
    countdown -= 1
} while countdown > 0

print("Break time!")