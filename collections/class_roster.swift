// 1. Start with initial student names in an Array
var roster = ["Dara", "Sok", "Bopha"]

// 2. Add "Rithy" to the end
roster.append("Rithy")

// 3. Put "Vicheka" at the very front (index 0)
roster.insert("Vicheka", at: 0)

// 4. Print all data, the count, and the first name
print("All Data: \(roster)")
print("Count: \(roster.count)")
if let firstName = roster.first {
    print("First: \(firstName)")
}

// 5. Remove the name at position 2 (removes "Sok")
roster.remove(at: 2)
print("After removing: \(roster)")

// 6. Check whether "Dara" is still in the list
print("Has Dara: \(roster.contains("Dara"))")

// 7. Print an alphabetically sorted copy
let sortedRoster = roster.sorted()
print("Sorted: \(sortedRoster)")