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
var sets = set1.union(set2)
print(sets)

//2
var dictionary: [String: Float] = ["Fariza": 3.0, "Arai":4.5, "Sanzhar": 4.0]
dictionary["Fariza"] = 5.0
print(dictionary)

//3
var arr1 = ["apple", "banana"]
var arr2 = ["cherry", "date"]
print(arr1+arr2)



