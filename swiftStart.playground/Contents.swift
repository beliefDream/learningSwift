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


