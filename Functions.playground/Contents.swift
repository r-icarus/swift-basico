//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func fahrenheitToCelsius(fahrenheitValue: Double) -> Double {
    var result : Double
    result = (((fahrenheitValue - 32) * 5) / 9)
    return result
}

var outdoorTemperatureInFahrenheit = 88.2
var outdoorTemperatureInCelsius = fahrenheitToCelsius(outdoorTemperatureInFahrenheit)

func celsiusToFahrenheit(celsiusValue : Double) -> Double {
    var result : Double
    result = (((celsiusValue * 9)/5)+32)
    return result
}

outdoorTemperatureInFahrenheit = celsiusToFahrenheit(outdoorTemperatureInCelsius)


func buildASentence(subject: String, verb: String, noun: String) -> String {
    return "\(subject) \(verb) \(noun)!"
}

buildASentence("Swift", verb: "is",noun: "cool")
buildASentence("I", verb: "love", noun: "languages")

func addMyAccountBalance(balances: Double...) -> Double {
    var result : Double = 0
    for balance in balances {
        result += balance
    }
    return result
}


addMyAccountBalance(77.87)
addMyAccountBalance(10.52, 11.30, 100.60)
addMyAccountBalance(345.12, 1000.80, 233.10, 104.80, 99.90)

var account1 = ("State Bank Personal", 1011.10)
var account2 = ("State Bank Business", 24309.63)

func deposit(amount: Double, account: (name: String, balance: Double)) -> (String, Double) {
    let newBalance : Double = account.balance + amount
    return (account.name, newBalance)
}

func withdraw(amount: Double, account: (name: String, balance: Double)) -> (String, Double) {
    let newBalance : Double = account.balance - amount
    return (account.name, newBalance)
}

let mondayTransaction = deposit
let fridayTransaction = withdraw

let mondayBalance = mondayTransaction(300.0, account: account1)
let fridayBalance = fridayTransaction(1200, account: account2)


func chooseTransaction(transaction: String) -> (Double, (String, Double)) -> (String, Double) {
    if transaction == "Deposit" {
        return deposit
    }
    return withdraw
}

let myTransaction = chooseTransaction("Withdraw")
myTransaction(224.22, account2)

chooseTransaction("Deposit")(64.53, account1)

func writeCheck(payee: String = "Unknown", amount : String = "10.00") -> String {
    return "Check payable to \(payee) for \(amount)"
}

writeCheck()
writeCheck(amount: "20.00")
writeCheck("Fulanito de Tal", amount: "100.00")


let simpleInterestCalculationClosure = {(loanAmount: Double, var interestRate : Double, years: Int) -> Double in
    interestRate = interestRate / 100.0
    var interest = Double(years) * interestRate * loanAmount
    return loanAmount + interest
}

let compoundInterestCalculationClosure = { (loanAmount : Double, var interestRate : Double, years : Int) -> Double in
    interestRate = interestRate / 100.0
    var compoundMultiplier = pow(1.0 + interestRate, Double(years))
    
    return loanAmount * compoundMultiplier
}

func loanCalculator(loanAmount: Double, interestRate: Double, years: Int, calculator: (Double, Double, Int) -> Double) -> Double
{
        let totalPayout = calculator(loanAmount, interestRate, years)
    return totalPayout
}

var simple = loanCalculator(100_000, interestRate: 3.875, years: 5, calculator: simpleInterestCalculationClosure)

var compound = loanCalculator(100_000, interestRate: 3.875, years: 5, calculator: compoundInterestCalculationClosure)


func isLeapYear(year : Int) -> Bool {
    return (year%4 == 0 && year%100 != 0) || year%400 == 0
}

isLeapYear(1900)
isLeapYear(2000)
isLeapYear(2016)
isLeapYear(2100)
var 💜 = 2012
isLeapYear(💜)
let 🦄 = 2600
isLeapYear(🦄)


var message = "El veloz murciélago hindú comía feliz cardillo y kiwi"
var words = message.componentsSeparatedByString(" ")
words.count
words[4]

message.rangeOfString("perro") != nil ? true : false

