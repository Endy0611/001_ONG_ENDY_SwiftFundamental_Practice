// 1. Print the 7 times table from 1 to 10 (inclusive) using a closed range (...)
for i in 1...10 {
    print("7 x \(i) = \(7 * i)")
}

// Print an empty line to match the output spacing
print("")

// 2. Store the course topics in an array
let topics = ["Variables", "Conditionals", "Loops", "Collections"]

// 3. Print numbered list using a half-open range (..<) to stop before topics.count
for index in 0..<topics.count {
    print("\(index + 1). \(topics[index])")
}