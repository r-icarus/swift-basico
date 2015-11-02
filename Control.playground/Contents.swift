//: Playground - noun: a place where people can play

import UIKit

var str = "Hola, playground"

var semaforo = "Verde"

if semaforo == "Rojo" {
    print("Stop!")
} else{
    print("Go!")
}

var number1 : Int = 33
var number2 : Int = 101

if number1 >= number2 {
    print("33 es mas grande que 101")
} else {
    print("33 es mas pequeño que 101")
}

let tree1 = "Oak"
let tree2 = "Pecan"
let tree3 = "Maple"

let treeCompare1 = tree1 > tree2
let treeCompare2 = tree2 > tree3

var treeArray = [tree1, tree2, tree3]

for tree in treeArray {
    if tree == "Oak" {
        print("Furniture")
    }
    else if tree == "Pecan" {
        print("Pie")
    }else if tree == "Maple" {
        print("Syrup")
    }
}


//treeArray += ["Cherry"]
treeArray.append("Cherry")

for tree in treeArray {
    switch tree{
        case "Oak":
            print("Furniture")
        case "Pecan", "Cherry":
            print("Pie")
        case "Maple":
            print("Syrup")
        default:
            print("Wood")
    }
}



var position = 8

switch position {
    case 1:
        print("\(position)ro")
    case 2:
        print("\(position)do")
    case 3:
        print("\(position)ro")
    case 4...6:
        print("\(position)to")
    case 7:
        print("\(position)mo")
    case 8:
        print("\(position)vo")
    default:
        print("No cubierta")
}

var base = 2
var target = 1000
var value = 0
while value < target {
    value += base
}

repeat {
    value += base
} while value < target


var speedLimit = 75
var carSpeed = 0

while(carSpeed < 100){
    carSpeed++
    switch carSpeed {
        case 0..<20:
            print("\(carSpeed): Vas muy lento")
        case 20..<30:
            print("\(carSpeed): Acelera")
        case 30..<40:
            print("\(carSpeed): Vas mejor")
        case 40..<50:
            print("\(carSpeed): Ya casi vas a buena velocidad")
        case 50..<60:
            print("\(carSpeed): Buena velocidad")
        case 60..<70:
            print("\(carSpeed): Velocidad crusero")
        case 70...speedLimit:
            print("\(carSpeed): Cuidado, cerca del limite de velocidad")
        default:
            print("\(carSpeed): Fotomulta!")
    }
    if carSpeed > speedLimit {
        break
    }
}
