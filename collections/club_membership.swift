// 1. Create sets (sets ignore duplicates automatically)
var codingClub: Set = ["Dara", "Sok", "Bopha"]
let mathClub: Set = ["Sok", "Rithy", "Bopha"]

// 2. Try adding "Dara" again (count stays 3)
codingClub.insert("Dara")
print("Coding club size: \(codingClub.count)")

// 3. Intersection: items in both sets
let bothClubs = codingClub.intersection(mathClub).sorted()
print("In both clubs: \(bothClubs)")

// 4. Union: items in either set
let allMembers = codingClub.union(mathClub).sorted()
print("All members: \(allMembers)")