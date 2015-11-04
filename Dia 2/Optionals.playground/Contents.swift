//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var x : Int = 0
var y = x + 2

var a : Int?
a = 2
a = nil

var i : String?
var f : Float? = 2.5

f! + 2

f = nil

if f != nil {
    print("Todo bien \(f! + 2)")
} else {
    print("El opcional no tiene valor")
}

if let z = f {
    print("Todo bien \(z + 2)")
} else {
    print("El opcional no tiene un valor")
}

var cadenaOpcional : String? = "20"
print(cadenaOpcional)
print(Int("10"))

if let s = cadenaOpcional {
    if let i = Int(s) {
        print("El entero es \(i)")
    } else {
        print("La cadena no era un entero")
    }
} else {
    print("El opcional cadena estaba vacio")
}

if let s = cadenaOpcional, i = Int(s){
    print("El entero es \(i)")
}


let unEntero = 10
let otroEntero  = unEntero.successor()
print(otroEntero)

var enteroOpcional : Int? = 10
var siguienteEntero = enteroOpcional?.successor()
print("\(siguienteEntero)")

var librosFavoritos: [String] = ["El Principito", "El Alquimista", "El Arte de la Guerra"]
print(librosFavoritos.first)
librosFavoritos = []
librosFavoritos.first
let titulo : String = librosFavoritos.first ?? "Programando Swift"
print(titulo)