//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Door {
    var opened  = false
    var locked : Bool = false
    let width : Int = 32
    let height : Int = 72
    let weight : Int = 10
    let color : String = "Red"
    
    func open() -> String {
        opened = true
        return "La puerta esta abierta"
    }
    
    func close() -> String {
        opened = false
        return "La puerta esta cerrada"
    }
    
    func lock() -> String {
        locked = true
        return "La puerta esta cerrada con llave"
    }
    
    func unlock() -> String {
        locked  = false
        return "La puerta no esta cerrada con llave"
    }
}


let frontDoor = Door()

frontDoor.open()
frontDoor.close()

frontDoor.lock()
frontDoor.unlock()

frontDoor.color





class NewDoor {
    var opened = false
    var locked = false
    let width : Int
    let height : Int
    let weight : Int
    var color : String
    
    init(width : Int = 32, height : Int = 72, weight : Int = 10, color : String = "Red"){
        self.width = width
        self.height = height
        self.weight = weight
        self.color = color
    }
    
    func open(_: Void) -> String {
        if (opened == false){
            opened = true
            return "La puerta esta abierta"
        }
        else {
            return "La puerta ya estaba abierta"
        }
    }
    
    func close() -> String {
        if (opened == true){
            opened = false
            return  "La puerta esta cerrada"
        } else {
            return "La puerta ya estaba cerrada"
        }
    }
    
    func lock() -> String {
        locked = true
        return "La puerta esta cerrada con llave"
    }
    
    func unlock() -> String {
        locked  = false
        return "La puerta no esta cerrada con llave"
    }
}


let newFrontDoor = NewDoor()

newFrontDoor.close()
newFrontDoor.open()
newFrontDoor.width
newFrontDoor.height
//newFrontDoor.weight = 20

let newBackDoor = NewDoor(width: 36, height: 80, weight: 20, color: "Black")
newBackDoor.color = "Green"


class NewWoodDoor : NewDoor {
    init(width: Int, height: Int, weight: Int) {
        super.init(width: width, height: height, weight: weight, color: "Brown")
    }
}


class CombinationDoor : NewDoor {
    var combinationCode : String?
    
    override func lock() -> String {
        return "Método no válido para puerta de combinación"
    }
    
    override func unlock() -> String {
        return "Método no válido para puerta de combinación"
    }
    
    func lock(combinationCode : String) -> String{
        if(opened == false){
            if(locked == true){
                return "Ya esta cerrada con código"
            }
            self.combinationCode = combinationCode
            locked = true
            return "La puerta se cerró con código"
        } else {
            return "No puedes poner un código con la puerta abierta"
        }
    }
    
    func unlock(combinationCode : String) -> String {
        if (opened == false){
            if(locked == false) {
                return "La puerta ya esta sin código"
            }
            if( self.combinationCode != combinationCode){
                return "Código Incorrecto"
            }
            locked = false
            return "Se quitó el candado la puerta con el código"
        } else {
            return "No puedes quitar el seguro a una puerta abierta"
        }
    }
}


let securityDoor = CombinationDoor()
securityDoor.width
securityDoor.height
securityDoor.weight
print(securityDoor.combinationCode)

securityDoor.unlock()
securityDoor.lock()

securityDoor.unlock("6809")
securityDoor.lock("6809")
securityDoor.unlock("3344")
securityDoor.unlock("6809")



class Tractor {
    let horsePower : Int
    let color : String
    
    init(horsePower: Int, color: String){
        self.horsePower = horsePower
        self.color = color
    }
    
    convenience init(horsePower: Int){
        self.init(horsePower: horsePower, color: "Green")
    }
    
    convenience init(color: String){
        self.init(horsePower: 42, color: color)
    }
    
    convenience init() {
        self.init(horsePower: 42, color: "Green")
    }
}

let myTractor = Tractor()
let myBiggerTractor = Tractor(horsePower: 75)
let myOrangetractor = Tractor(horsePower: 30, color: "Orange")
let myYellowTractor = Tractor(color: "Yellow")


enum FuelType : String {
    case Gasoline = "89 octane"
    case Diesel = "sulpher free"
    case Biodiesel = "vegetable oil"
    case Electric = "30 amps"
    case NaturalGas = "coalbed methane"
}

var engine : FuelType = .Diesel

var vehicleName : String

switch engine {
    case .Gasoline:
        vehicleName = "Ford F-150"
    case .Diesel:
        vehicleName = "Ford F-250"
    case .Biodiesel:
        vehicleName = "Custom Van"
    case .Electric:
        vehicleName = "Toyota Prius"
    case .NaturalGas:
        vehicleName = "Utility Truck"
}

print("\(vehicleName) uses \(engine.rawValue)")

enum TransmissionType {
    case Manual4Gear
    case Manual5Gear
    case Automatic
}

struct Vehicle {
    var fuel : FuelType
    var transmission : TransmissionType
}

var dieselAutomatic = Vehicle(fuel: .Diesel, transmission: .Automatic)

var gasoline4Speed = Vehicle(fuel: .Gasoline, transmission: .Manual4Gear)

struct Structure {
    var copyVar : Int = 10
}

var struct1 = Structure()
var struct2 = struct1
struct2.copyVar = 20
print(struct1.copyVar)
print(struct2.copyVar)

class Class {
    var copyVar : Int = 10
}

var class1 = Class()
var class2 = class1
class2.copyVar = 20
print(class1.copyVar)
print(class2.copyVar)



struct Triangle {
    var base : Double
    var height : Double
    
    func area() -> Double {
        return (0.5 * base) * height
    }
}

var t = Triangle(base: 4, height: 12)
print(t.area())
