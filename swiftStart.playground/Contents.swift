//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


/**
 *  5 控制流
 */

// 5.1  for循环
//遍历一个 区间的元素
for index in 1...5{
    print("\(index) * 5")
}
//遍历区间的元素， 没必要使用 当前索引值, 可使用 _ 代替索引值
for _ in 1...3 {
    print("hello world")
}


//遍历数组中的元素
let names = ["w", "n", "a", "b"]
for name in names {
    print("\(name)")
}

//遍历字典的元素
let ages = ["w": 3, "a": 5, "q": 9]
for (name, age) in ages {
    print("\(name) , \(age)")
}


// 5.2 while
var index = 1
while index <= 3 {
    print("\(index)")
    index += 1
}

repeat {
    print("\(index)")
    index += 1
}while index < 5


/// 5.3 if
let number = 5
if number < 10 {
    print("< 10")
}else {
    print(">= 10")
}

// 5.4 switch case
switch number {
case 5 : print(5)
case 4 : print(3)
    
case 0: print(0)
default : print("")
}


let point = (1, 5)
switch point {
case (_, 0):
    print("y = 0")
case (0, _):
    print("x = 0")
case let (x, y) where x == y:
    print("\(x) \(y)")
default :
    print("....x")
}

// 5.5 标签语句 
var a = 5
gameover: while a < 8 {
    switch 1 {
    case 7:
    break gameover
    default :
        a += 1
    }
}

if #available(iOS 9, *) {
    print("paltform iOS 9");
}else {
    print("now")
}




///   6 函数
// 6.1 函数的基本使用
func printName(){
    print("printName ")
}
printName()

func printName(name: String) -> Void {
    print("\(name)")
}
printName("huangjichao")

func returnName(name: String) -> String {
    return name + " hello"
}
returnName("huangjichao")

func addNumber(number:Int, number2: Int) -> Int {
    return number + number2;
}
addNumber(3, number2: 4)


// 6.2指定外部参数名
func sayHello(to Person1: String , from Person2 : String) -> Void {
    print("\(Person2) say hello to \(Person1) ")
}
sayHello(to: "me", from: "she")

// 练习
func reduceNumber(number1 number11: Int, number2 number22: Int) -> Int {
    return number11 - number22;
}
reduceNumber(number1: 3, number2: 2)



// 6.3隐藏  第二个及以后的外部参数名
func someFunc(number:Int, _ number2: Int) -> Void {
    
}
someFunc(3, 3)



// 6.4 默认参数
func printDefaultNumber(number: Int = 6) {
    print("\(number)")
}

printDefaultNumber()
printDefaultNumber(8)

// 6.5 可变参数
func sumNumber(numbers:Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number;
    }
    return sum
}

sumNumber(3, 4)
sumNumber(1, 3, 4)


// 6.6  输入输出参数
var number1 = 3
var number2 = 5
func swapTwoNumber(inout num1: Int,inout num2: Int) {
    let tmpNum = num1;
    num1 = num2;
    num2 = tmpNum;
}
swapTwoNumber(&number1, num2: &number2)

// 6.7 使用函数类型
let swapFunc: (inout  Int, inout Int) -> Void = swapTwoNumber
swapFunc(&number1, &number2)

