// 1. Custom error type conforming to the Error protocol
enum ScoreError: Error {
    case notANumber(String)
    case negative(Int)
    case above100(Int)
}

// 2. parseScore: marked with 'throws' because it can throw an error
func parseScore(_ text: String) throws -> Int {
    // Int(text) returns an optional Int? (nil if text is not digits)
    guard let value = Int(text) else {
        throw ScoreError.notANumber(text)
    }
    
    guard value >= 0 else {
        throw ScoreError.negative(value)
    }
    
    guard value <= 100 else {
        throw ScoreError.above100(value)
    }
    
    return value
}

// 3. Process inputs without stopping on bad input
let inputs = ["88", "-4", "120", "ninety"]

for input in inputs {
    do {
        // Calling a throwing function requires 'try' inside a 'do' block
        let score = try parseScore(input)
        print("Saved score: \(score)")
    } catch ScoreError.notANumber(let text) {
        print("Error: \"\(text)\" is not a number.")
    } catch ScoreError.negative(let value) {
        print("Error: \(value) is negative.")
    } catch ScoreError.above100(let value) {
        print("Error: \(value) is above 100.")
    } catch {
        print("Error: Unknown error occurred.")
    }
}