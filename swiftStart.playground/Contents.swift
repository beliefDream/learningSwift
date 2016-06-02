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





///  7闭包

// 7.1 sort
let name7s = ["b", "a", "w", "q"]
func backwards(s1:String, s2: String) -> Bool {
    return s1 < s2
}

// 7.1.1 sort中 调用系统的方法  <#T##isOrderedBefore: (String, String) -> Bool##(String, String) -> Bool#>
name7s.sort { (s11, s22) -> Bool in
    return s11 > s22
}

name7s.sort { (s1: String, s2: String) -> Bool in
    return s1 > s2;
}

// 7.1.2 sort 中调用  自定义的函数
print( name7s.sort(backwards) )

// 7.1.3 根据上下文推断类型
var reversed = name7s.sort( {s1, s2 in return s1 > s2 } )

// 7.1.4 单表达式闭包隐式 返回
reversed = name7s.sort( {s1, s2 in s1 > s2 } )

//// 7.1.5 参数名称缩写
reversed = name7s.sort( {$0 > $1 })
print(reversed)

//  7.1.6 运算符函数
reversed = name7s.sort( < )

// 7.1.7  值捕获
func makeIncrementor(forIncrement amount: Int) -> () ->Int {
    var runningTotal = 0
    func incrementor() ->Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}

let incrementByTen = makeIncrementor(forIncrement: 10)
print(incrementByTen)
incrementByTen()
let incrementBySeven = makeIncrementor(forIncrement: 7)
incrementBySeven()

incrementByTen()


// 7.1.8 闭包是引用类型





// 8 枚举
// 8.1  枚举的写法1
enum CompassPoint {
    case North
    case South
    case West
    case East
}
//  写法2
enum CompassPoint2 {
    case North, South, West, East
}

// 8.2 定义 枚举型变量
var direction = CompassPoint.East

direction = .North
direction = .South
switch  direction {
case .North :
    print("north")
case .South :
    print("south")
case .West :
    print("west")
case .East :
    print("east")
}

// 8.3   关联值  (较 常用的 枚举写法稍复杂些)
enum Barcode {
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}

var productBarcode = Barcode.UPCA(8, 111, 222, 3)
productBarcode = .QRCode("ABCD")

switch productBarcode {
case .UPCA(let a, let b, let c, let d):
    print("\(a), \(b), \(c), \(d)")
case .QRCode(let code):
    print(code)
}

switch productBarcode {
case let .UPCA(a, b, c, d):
    print(a + b + c + d)
case let .QRCode(code):
    print(code)
}


//8.4 原始值
enum ASCIICharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case Return = "\r"
}

// 8.4.1 原始值 的隐式赋值
enum Planet: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
enum ComPassPoint: String {
    case North, South, East, West
}
let earthsOrder = Planet.Earth.rawValue
print(earthsOrder)

let sunsetDirection = ComPassPoint.West.rawValue
print(sunsetDirection)

// 8.4.2 使用原始值 初始化 枚举实例
let possiblePlanet = Planet(rawValue :7)
print(possiblePlanet)

// 8.5.3 枚举递归 
