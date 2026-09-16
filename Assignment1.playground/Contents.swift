// Practice 1

// Step 1
let firstName: String = "Fariza"
let lastName = "Alzhan"
var age: Int = 21
let birthYear = 2005
var isStudent: Bool = true
var height: Double = 1.65

//bonus
let currentYear = 2026
age = currentYear - birthYear
print(age)

// Step 2
var hobby: String = "dancing"
var numberOfHobbies = 3
let favoriteNumber = 67
var isHobbyCreative: Bool = true

var status = "student"
let city = "Pavlodar"
var hobbies = ["stretching" , "reading"]

// Bonus futureGoals
let studentYear = 4
var semester = 7
let discipline = "IOS development"
var emoji = "🤩"
var isPrediction: Bool = true

// Step 3
var lifeStory = "My name is \(firstName). I am from \(city). I am \(age) years old, born in \(birthYear). I am currently a \(status). \nI enjoy \(hobby), which is \(isHobbyCreative ? "a creative" : "not a creative") hobby. I also love \(hobbies[0]), and \(hobbies[1]), in total i have \(numberOfHobbies) hobbies, and my favorite number is \(favoriteNumber)."

var futureGoals = "Right now I'm a \(studentYear)rd year student. In this \(semester)th semester I chose the \(discipline) discipline. I'm super excited about it \(emoji), and I believe I will achieve it \(isPrediction ? "🥳" : "😔")"

//Step 4
print(lifeStory)
print(futureGoals)

// Result
/*
 21
 My name is Fariza. I am from Pavlodar. I am 21 years old, born in 2005. I am currently a student.
 I enjoy dancing, which is a creative hobby. I also love stretching, and reading, in total i have 3 hobbies, and my favorite number is 67.
 Right now I'm a 4rd year student. In this 7th semester I chose the IOS development discipline. I'm super excited about it 🤩, and I believe I will achieve it 🥳
 */






