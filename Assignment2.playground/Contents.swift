// Practice 2 : Working with Collections in Swift

//Easy tasks
print("Easy tasks: ")
//1
let fruits: [String] = ["apple" , "banana", "orange", "pear" , "grape"]
print(fruits[2])

//2
var setNumber: Set<Int> = [52, 67, 1, 2, 3]
setNumber.insert(76)
print(setNumber)

//3
var dicNames: [String: Int] = ["Swift": 2014 , "Python": 1991, "Go":2009]
print(dicNames["Swift"])
print(dicNames["Swift"]!)

//4
var colors: [String] = ["red", "blue", "yellow", "brown"]
colors[1] = "pink"
print(colors)

//Medium tasks
print("Medium tasks: ")
//1
var set1: Set<Int> = [1,2,3,4]
var set2: Set<Int> = [3,4,5,6]
var sets = set1.intersection(set2)
print(sets)

//2
var dictionary: [String: Float] = ["Fariza": 3.0, "Arai":4.5, "Sanzhar": 4.0]
dictionary["Fariza"] = 5.0
print(dictionary)

//3
var arr1 = ["apple", "banana"]
var arr2 = ["cherry", "date"]
print(arr1+arr2)

//Hard Tasks
print("Hard Tasks: ")
//1
var dicCountry: [String: Int] = ["Russia": 144200000, "China": 1405918803, "India": 1429700205, "United States": 342620143]
dicCountry["Kazakhstan"] = 20330000
print(dicCountry)

//2
var setAnimals1: Set<String> = ["cat", "dog"]
var setAnimals2: Set<String> = ["mouse", "dog"]
var setUnion = (setAnimals1.union(setAnimals2))
print(setUnion.subtracting(setAnimals2))

//3
var dicGrades: [String: [Int]] = [
    "Fariza": [90,85,78],
    "Arai": [95,65,87],
    "Sanzhar": [100,76,86]]
print(dicGrades["Arai"]!)
