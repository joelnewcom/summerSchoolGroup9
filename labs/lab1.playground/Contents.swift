// Group N. 9 Joel Neukom and Daniel Salgo

import UIKit

// Problem #1let myString = "hello"
var cost: Double = 3.14
let cnt: Int = 2
var shouldWe: Bool = true
let hex = 0xB
let dec = 0b1010


// Problem #2
var literal = "This is a calculation: \(cost * 4)"

// Problem #3
var someWords :[String] = ["queen", "worker", "drone"]
println("first item of my array: " + someWords[0])
someWords.append("honey")
someWords += ["are","us"]

// Problem #4
for item in someWords{
    println(item)
}

for (index, value) in enumerate(someWords){
    println("Item # \(index)" + value)
}

// Problem #5
var myDictionary : Dictionary<String, Float> = ["Mark Twain":8.9,"Nathaniel Hawthorne":5.1,"John Steinbeck":2.3,"C.S. Lewis":9.9,"Jon Krakaur":6.1,]

// Problem #6
println(myDictionary["John Steinbeck"])
myDictionary["Erik Larson"] = 9.2
if (myDictionary["Jon Krakaur"] > myDictionary["Mark Twain"]){
    println(myDictionary["Jon Krakaur"])}
    else{
    myDictionary["Mark Twain"]
}

// Problem #7
for (index, value) in enumerate(myDictionary){
    println("key: \(index) value: \(value)")
}

// Problem #8
for index in 1...10{
    println(index)
}

// Problem #9
for var index = 10; index >= 1; --index{
    println("index: \(index)")
}

// Problem #10
var x = 5
var y = 10
var result = 0
for _ in 1...y {
    result = result + x
}

// Problem #11
var average : Float = 0.0
for myValue  in myDictionary.values{
    average = myValue + average
}
average = average / Float(myDictionary.count)

// Problem #12
if (average < 5){
    println("low")
}else if(average >= 5 && average < 7){
    println("moderate")
}else{
    println("high")
}

// Problem #13
// Problem #14
func verbalizeNumber(inputParam:Int)-> String{
    
    
    var strOut:String
    
    switch inputParam{
    case 0:
        strOut = "none"
    case 1...3:
            strOut = "a few"
    case 4...9:
                strOut = "several"
    case 10...99:
                    strOut = "tens of"
    case 100...999:
                        strOut = "hunddreds of"
    case 1000...999999:
                            strOut = "thousends of"
    default:
                                strOut = "millions of"
        
    }
    return strOut
}

var returnedString = verbalizeNumber(1000)

// Problem #15
for var index = 1; index <= 100000000; index*=10{
    println("the output of my function: \(verbalizeNumber(index))")
}

// Problem #16
func verbalizeAndShoutNumber(inputParam:Int) -> String{
    return(verbalizeNumber(inputParam).capitalizedString)
}


// Problem #17
func expressNumbersElegantly(max:Int, verbalizeFunction: (Int) -> String) -> String{
    var concatenated:String = ""
    for var index = 1; index <= max; index*=10{
        concatenated += verbalizeFunction(index)
    }
    return concatenated
}

var numberFunction:(Int) -> String = verbalizeNumber
expressNumbersElegantly(10000, numberFunction)

numberFunction = verbalizeAndShoutNumber
expressNumbersElegantly(10000, numberFunction)

//Problem 18
func expressNumbersVeryElegantly(#maximum:Int, #functionToVerbalize: (Int) -> String) -> String{
    var concatenated:String = ""
    for var index = 1; index <= maximum; index*=10{
        concatenated += functionToVerbalize(index)
    }
    return concatenated
}

expressNumbersVeryElegantly(maximum:1000, functionToVerbalize:verbalizeAndShoutNumber)

//Problem 19
var famousLastWords = ["the cow jumped over the moon.", "three score and four years ago", "lets nuc 'em Joe!", "ah, there is just something about Swift"]

let capitalizedFirstLetter = famousLastWords.map{
    (word) -> String in
    var fullWord = word
    var firstLetter = Character(word.substringToIndex(advance(word.startIndex, 1)).uppercaseString)
    return String(firstLetter) + dropFirst(fullWord)

}

    
