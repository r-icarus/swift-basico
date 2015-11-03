//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

protocol LockAndUnlockProtocol {
    func lock() -> String
    func unlock() -> String
}

class House : LockAndUnlockProtocol {
    func lock() -> String {
        return "Click!"
    }
    func unlock() -> String {
        return "Clack"
    }
}

class Vehicle : LockAndUnlockProtocol {
    func lock() -> String {
        return "Beep-beep!"
    }
    
    func unlock() -> String {
        return "Beep!"
    }
}

let myHouse = House()
myHouse.lock()
myHouse.unlock()

let myCar = Vehicle()
myCar.lock()
myCar.unlock()


protocol NewLockAndUnlockProtocol {
    var locked : Bool {get set}
    func lock() -> String
    func unlock() -> String
}

class Gate : NewLockAndUnlockProtocol {
    var locked : Bool = false
    
    func lock() -> String {
        locked = true
        return "Clink!"
    }
    
    func unlock() -> String {
        locked = false
        return "Clonk!"
    }
}

let myGate = Gate()
myGate.lock()
myGate.unlock()


protocol AreaComputationProtocol {
    func computeArea() -> Double
}

protocol PerimeterComputationProtocol {
    func computePerimeter() -> Double
}


struct Rectangle : AreaComputationProtocol, PerimeterComputationProtocol {
    var width, height : Double
    
    func computeArea() -> Double {
        return width * height
    }
    
    func computePerimeter() -> Double {
        return width * 2 + height * 2
    }
}

var square = Rectangle(width: 3, height: 3)
var rectangle = Rectangle(width: 4, height: 6)

square.computeArea()
square.computePerimeter()

rectangle.computeArea()
rectangle.computePerimeter()


protocol TriangleProtocol : AreaComputationProtocol, PerimeterComputationProtocol {
    var a : Double { get set}
    var b : Double { get set}
    var c : Double { get set}
    var base : Double {get set}
    var height : Double {get set}
}

struct Triangle : TriangleProtocol {
    var a, b, c : Double
    var height, base : Double
    
    func computeArea() -> Double {
        return (base * height) / 2
    }
    
    func computePerimeter() -> Double {
        return a + b + c
    }
}

var triangle1 = Triangle(a: 4, b: 5, c: 6, height: 12, base: 10)

triangle1.computeArea()
triangle1.computePerimeter()


protocol VendingMachineProtocol {
    var coinInserted : Bool {get set}
    func shouldVend() -> Bool
}

class Vendor : VendingMachineProtocol {
    var coinInserted : Bool = false
    
    func shouldVend() -> Bool {
        if coinInserted == true{
            coinInserted = false
            return true
        }
        return false
    }
}

class ColaMachine{
    var vendor : VendingMachineProtocol
    init(vendor: VendingMachineProtocol){
        self.vendor = vendor
    }
    
    func insertCoin(){
        vendor.coinInserted = true
    }
    
    func pressColaButton() -> String{
        if vendor.shouldVend() == true {
            return "Tome su Coca Cola"
        } else {
            return "Inserte primero una moneda"
        }
    }
    
    func pressRootBeerButton() -> String {
        if vendor.shouldVend() == true {
            return "Tome su Root Beer"
        } else {
            return "Inserte primero una moneda"
        }
    }
}

var vendingMachine = ColaMachine(vendor: Vendor())

vendingMachine.pressColaButton()
vendingMachine.insertCoin()
vendingMachine.pressRootBeerButton()


extension ColaMachine {
    func pressDietColaButton() -> String {
        if vendor.shouldVend() == true {
            return "Tome su Diet Coke"
        } else{
            return "Inserte primero una moneda"
        }
    }
}

var newVendingMachine = ColaMachine(vendor: Vendor())

newVendingMachine.insertCoin()
newVendingMachine.pressDietColaButton()

vendingMachine.insertCoin()
vendingMachine.pressDietColaButton()

extension Int {
    var kb : Int { return self * 1024}
    var mb : Int { return self * 1024 * 1024 }
    var gb : Int { return self * 1024 * 1024 * 1024}
}

var x : Int = 4
x.kb
x
var y = 8.mb
var z = 2.gb


extension Double {
    var F : Double { return self}
    var C : Double { return (((self - 32.0) * 5.0 / 9.0))}
    var K : Double { return (((self - 32.0)/1.8) + 273.15)}
}

var temp = 80.4.F
var tempC = temp.C
var tempK = temp.K

extension String {
    func prependString(value: String) -> String {
        return value + self
    }
    
    func appendString(value: String) -> String {
        return self + value
    }
}


"x".prependString("prefijo")
"y".appendString("sufijo")

extension Int {
    mutating func triple(){
        self = self * 3
    }
}

var numero = 3
numero.triple()
numero


extension String {
    mutating func decorate(){
        self = "----- " + self + " -----"
    }
}

var testString = "decorate this"
testString.decorate()
testString


extension Int {
    func times(work: () -> ()) {
        for _ in 0..<self {
            work()
        }
    }
    
    func timesWithIndex(work: (index: Int) -> ()){
        for i in 0..<self {
            work(index: i)
        }
    }
}

5.times({
  print("Hola a todos")
})

10.timesWithIndex({ (index: Int) -> () in
    print("Hola al indice \(index)")
})
