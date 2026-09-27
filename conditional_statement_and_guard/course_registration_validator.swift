func register(name: String, age: Int, hasPaid: Bool) {
    // 1. Check if name is not empty
    guard !name.isEmpty else {
        print("Error: Name is required.")
        return
    }
    
    // 2. Check minimum age
    guard age >= 16 else {
        print("Error: \(name) is too young to register.")
        return
    }
    
    // 3. Check payment status
    guard hasPaid else {
        print("Error: \(name) has not paid the fee.")
        return
    }
    
    // 4. Reaches here only if all checks pass
    print("\(name) is registered.")
}

// Test calls
register(name: "Dara", age: 20, hasPaid: true)
register(name: "Sok", age: 15, hasPaid: true)
register(name: "Vicheka", age: 19, hasPaid: false)
register(name: "", age: 22, hasPaid: true)