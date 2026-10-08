// =============================================================
//  Station ALMA-7: Rescue Protocol
//  iOS Mobile Development · Module 3 · Lab Assignment
//
//  How to use:
//   • Xcode: File → New → Playground → Blank, replace everything
//     with this file's contents.
//   • Terminal: swift ALMA7_Starter.swift
//
//  Rules:
//   • Do NOT modify the STARTER CODE section.
//   • `!` (force unwrap) is forbidden: −0.5 points each.
//   • No map / filter / reduce / compactMap.
//   • Use the exact function names from the assignment PDF.
// =============================================================


// MARK: - =================== STARTER CODE ===================
// MARK: - Do not modify anything in this section

typealias Reading = (sensor: String, value: Int)

/// Splits a string at the first occurrence of the separator.
/// splitOnce("O2:87", by: ":") -> ("O2", "87")
/// splitOnce("hello", by: ":") -> nil
func splitOnce(_ line: String, by separator: Character) -> (String, String)? {
    guard let index = line.firstIndex(of: separator) else { return nil }
    let left = String(line[..<index])
    let right = String(line[line.index(after: index)...])
    return (left, right)
}

let rawLog = [
    "O2:87", "TEMP:-12", "O2:9x", "PRESS:101", "TEMP:abc", "O2:",
    "RAD:3", "O2:64", ":55", "TEMP:31", "PRESS:98", "O2:71",
    "RAD:-1", "TEMP:4", "PRESS:1o2", "O2:90"
]

class Tank {
    var level: Int
    init(level: Int) { self.level = level }
}

class Module {
    let name: String
    var oxygenTank: Tank?
    init(name: String, oxygenTank: Tank?) {
        self.name = name
        self.oxygenTank = oxygenTank
    }
}

class CrewMember {
    let name: String
    let role: String
    let priority: Int      // 1 = evacuated first
    var module: Module?    // nil = in open space
    init(name: String, role: String, priority: Int, module: Module?) {
        self.name = name
        self.role = role
        self.priority = priority
        self.module = module
    }
}

let lab  = Module(name: "Lab",  oxygenTank: Tank(level: 40))
let hab  = Module(name: "Hab",  oxygenTank: Tank(level: 12))
let dock = Module(name: "Dock", oxygenTank: nil)

let crew = [
    CrewMember(name: "Timur",   role: "Engineer",  priority: 3, module: lab),
    CrewMember(name: "Dana",    role: "Scientist", priority: 4, module: dock),
    CrewMember(name: "Aigerim", role: "Commander", priority: 1, module: hab),
    CrewMember(name: "Nurlan",  role: "Pilot",     priority: 2, module: nil)
]

var roster: [String: CrewMember] = [:]
for member in crew { roster[member.name] = member }

print("ALMA-7 systems online: \(rawLog.count) log lines, \(crew.count) crew members.")

// MARK: - ================= END OF STARTER CODE =================


// MARK: - =================== YOUR SOLUTION ===================
// Uncomment each signature when you start working on it.


// MARK: Level 1 · Decoding Telemetry

// 1.1
/*
 it contains : +
 the sensor name (left side) is not empty +
 the value (right side) is an integer +
 the value is >= 0 , except for the TEMP sensor (temperature can be negative) +
 */

func parseReading(_ raw: String) -> Reading? {            //переменна которая может принести нам либо знач/nil
    guard let (sensorName, sensorValue) = splitOnce(raw, by: ":"),
          !sensorName.isEmpty,
          let value = (Int(sensorValue)),
          value >= 0  || sensorName == "TEMP"
    else { return nil }
    return (sensorName,value)
}
print("Level 1 - 1.1")
print(parseReading("O2:87"))
print(parseReading("TEMP:-12"))
print(parseReading("O2:9x"))
print(parseReading("PRESS:101"))
print(parseReading("TEMP:abc"))
// выводит либо optional() or nil

/* 1.2
 Reading - контейнер с (sensor: String, value: Int)
 1)собрать все норм записи
 2)добавлять все инвалид нил записи
*/

func parseLog(_ lines: [String]) -> (valid: [Reading], invalidCount: Int) {
    var reading: [Reading] = []
    var nilCount: Int = 0
    for line in lines {
        if let val = parseReading(line){
            reading.append(val)
        }
        else{ nilCount += 1 }
    }
    return (reading, nilCount)
}
print("Level 1 - 1.2")
print(parseLog(rawLog))
//(valid: [(sensor: "O2", value: 87), (sensor: "TEMP", value: -12), (sensor: "PRESS", value: 101), (sensor: "RAD", value: 3), (sensor: "O2", value: 64), (sensor: "TEMP", value: 31), (sensor: "PRESS", value: 98), (sensor: "O2", value: 71), (sensor: "TEMP", value: 4), (sensor: "O2", value: 90)], invalidCount: 6)
let A = parseLog(rawLog).invalidCount
print(A)


// MARK: Level 2 · Analysis

/*2.1
1)The select call must use a trailing closure and $0
2)нужно прописать так чтобы селект читал ридингс по одному как массив и обределяла тру/фолс и потом сохраняла все тру в массив
3)$0 это первое значение в массиве
*/

func select(_ readings: [Reading], where isIncluded: (Reading) -> Bool) -> [Reading] {
    var result: [Reading] = []
    for reading in readings {
        if isIncluded(reading) {
            result.append(reading)
        }
    }
    return result
}
let validReadings = parseLog(rawLog)
let o2Readings = select(validReadings.valid) { $0.sensor == "O2" }
print("Level 2 - 2.1")
print(o2Readings)
//[87, 64, 71, 90]

func values(of readings: [Reading]) -> [Int] {
    var intValues: [Int] = []
    for reading in readings {
        intValues.append(reading.value)
    }
    return intValues
    
}

let o2Values = values(of: o2Readings)
print(o2Values)

/*2.2
1)работаем с 1 функ
*/
func stats(of values: [Int]) -> (min: Int, max: Int, average: Double)? {
    guard !values.isEmpty else { return nil }
    var currentMin = values[0]
    var currentMax = values[0]
    var total = 0
    for value in values {
        total += value
        if value < currentMin { currentMin = value }
        if value > currentMax { currentMax = value }
        
    }
    let average = Double(total) / Double(values.count)
    return (currentMin, currentMax, average)
    
}
print("Level 2 - 2.2")
print(stats(of: o2Values))
//Optional((min: 64, max: 90, average: 78.0))
//Optional((min: 2, max: 7, average: 4.5))


func stats(_ values: Int...) -> (min: Int, max: Int, average: Double)? {
    stats(of: values)
}
let B = Int(stats(of: o2Values)?.average ?? 0)
print(B)
print(stats())
//nil


// 2.3 · The Closure Ladder (5 sorts, then compare results in code)
/*
 Sort the valid readings by value in descending order in five ways, each shorter than the last:
 1. Full closure syntax with types and return
 2. Types inferred from context - убраем тип
 3. Implicit return
 4. Shorthand argument names $0 , $1
 5. Trailing closure
 All five results must match — verify this in code, not by eye.
 */
// 1
let sort1 = validReadings.valid.sorted(by: { (a: Reading, b: Reading) -> Bool in
    return a.value > b.value
})
print("Level 2 - 2.3")
print("sort1" , sort1)
//[(sensor: "PRESS", value: 101), (sensor: "PRESS", value: 98), (sensor: "O2", value: 90), (sensor: "O2", value: 87), (sensor: "O2", value: 71), (sensor: "O2", value: 64), (sensor: "TEMP", value: 31), (sensor: "TEMP", value: 4), (sensor: "RAD", value: 3), (sensor: "TEMP", value: -12)]

//2
let sort2 = validReadings.valid.sorted(by: {(a,b) in
    return a.value > b.value
})
print("sort2" , sort2)

//3
let sort3 = validReadings.valid.sorted(by: {(a,b) in
    a.value > b.value
})
print("sort3" , sort3)

//4
let sort4 = validReadings.valid.sorted(by: {
     $0.value > $1.value
})
print("sort4" , sort4)

//5
let sort5 = validReadings.valid.sorted {
    $0.value > $1.value
}
print("sort5" , sort5)


// MARK: Level 3 · Temperature Stabilization
print("Level 3 - 3.1")
// 3.1
func heatUp(_ t: Int) -> Int {
    return t + 5
}
func coolDown(_ t: Int) -> Int {
    return t - 3
}
func hold(_ t: Int) -> Int {
    return t
}
//fucn которая возращает функцию
//Below 18 → heatUp, above 24 → coolDown , otherwise → hold
func chooseProtocol(for temp: Int) -> (Int) -> Int {
    if temp < 18 { return heatUp }
    else if temp > 24 { return coolDown }
    else { return hold }
}

let temp1 = chooseProtocol(for: 20)
print(temp1(20))


// 3.2
/*
 пока темп вне диапазона 18...24 и шагов меньше maxSteps:
 1)выбираем протокол через chooseProtocol
 2)применяем к темп
 3)шаг +1
*/
func runUntilStable(from start: Int, maxSteps: Int = 10) -> (finalTemp: Int, steps: Int, isStable: Bool) {
    var temp = start
    var steps = 0
    while (temp < 18 || temp > 24) && steps < maxSteps {
        let action = chooseProtocol(for: temp)
        temp = action(temp)
        steps += 1
    }
    let stable = temp >= 18 && temp <= 24
    return (temp, steps, stable)
}
print("Level 3 - 3.2")
print(runUntilStable(from: 31))
print(runUntilStable(from: -100, maxSteps: 5))
//(finalTemp: 22, steps: 3, isStable: true)
//(finalTemp: -75, steps: 5, isStable: false)
 
// C = steps для самой низкой валидной температуры из лога
let tempReadings = select(validReadings.valid) { $0.sensor == "TEMP" }
let tempValues = values(of: tempReadings)
print(tempValues)
//[-12, 31, 4]
 
var C = 0
if let tempStats = stats(of: tempValues) {
    C = runUntilStable(from: tempStats.min).steps
}
print("C =", C)
// 6

// MARK: Level 4 · The Crew

// 4.1
// func oxygenLevel(of member: CrewMember) -> Int? { }

// 4.2
// func status(of member: CrewMember) -> String { }

// 4.3
// @discardableResult
// func transferOxygen(from source: inout Int, to target: inout Int, amount: Int) -> Int { }

// let D = ...

// 4.4
// func evacuationOrder(_ names: String..., roster: [String: CrewMember]) -> [String] { }


// MARK: Level 5 · The Saboteur's Logbook
// The saboteur's code is below, commented out (it needs your
// oxygenLevel(of:) to compile). Comment on every problem, then
// write fixed versions and a test that proves the logic bug is gone.

/*
func reportOxygen(for member: CrewMember) -> String {
    let tank = member.module!.oxygenTank!
    return "\(member.name): \(tank.level)%"
}

func firstCritical(in crew: [CrewMember]) -> String {
    var result: String?
    for member in crew {
        if oxygenLevel(of: member)! < 20 {
            result = member.name
        }
    }
    return result!
}
*/


// MARK: Finale · Launch Code

// let launchCode = "\(A)-\(B)-\(C)-\(D)"
// print("LAUNCH CODE: \(launchCode)")


// MARK: Bonus

// func makeAlarm(threshold: Int) -> (Int) -> Bool { }


// MARK: - ================= DEFENSE QUESTIONS =================
/*
 1. guard let vs if let beyond syntax:

 2. Why can't you pass [Int] to stats(_ values: Int...)?

 3. Why doesn't transferOxygen(from: &x, to: &x, amount: 5) compile?

 4. Why doesn't oxygenLevel(of: dana) ?? "no data" compile?

 5. Full type of chooseProtocol and how to read it:

 Bonus. Where does the alarm counter live after makeAlarm returns?

*/




