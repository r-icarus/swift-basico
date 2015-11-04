Optionals
========


var x: Int
var y = x + 2


var a: Int?
a = 1
a = nil

var i: String?
var f: Float = 1.0

f! + 9

f = nil

if f != nil {
  print("Todo bien \(f!)")
} else {
  print("El optional no tiene valor")
}

if let z = f {
  print("Todo bien \(x)")
} else {
  print("El optional no tiene valor")
}


var cadenaOpcional: String? = "10"
if let s = cadenaOpcional {
  if let i = Int(s) {
    print("El entero es \(i)")
  }
}

if let s = cadenaOpcional, i = Int(s){
  print("El entero es \(i)")
}


let unEntero = 10
let otroEntero : Int = unEntero.successor()
print("\(otroEntero")


var enteroOpcional : Int? = 10
var siguienteEntero = enteroOpcional?.successor()
print("\(siguienteEntero)")

var librosFavoritos: [String] = []
let valor : String = librosFavoritos.first ?? "Programming Swift"
