//
//  main.swift
//  SimpleCalc
//
//  Created by Quan Nguyen on 3/31/17.
//  Copyright © 2017 Quan Nguyen. All rights reserved.
//

import Foundation
func factorial(factorialNumber: UInt64) -> UInt64 {
    if factorialNumber == 0 {
        return 1
    } else {
        return factorialNumber * factorial(factorialNumber: factorialNumber - 1)
    }
}
func processMultiOperator(arg: [String]){
    var yourArray = [Double]()
    var sum : Double = 0;
    var count : Int = 0;
    for word in arg{
        let number = Double(word);
        if(number != nil){
            yourArray.append(number!);
        }
    }
    let expandedOperator : String = arg[arg.count - 1];
    for number in yourArray{
        sum += Double(number)
        count += 1
    }
    if(expandedOperator == "count"){
        print("Result: \(count)")
    }else if(expandedOperator == "avg"){
        print("Result: \(Double(Double(sum) / Double(count)))")
    }else if(expandedOperator == "fact"){
        if(yourArray.count > 1){
            print("fact operator can only take one number")
        }else{
            print("Result: \(factorial(factorialNumber: UInt64(yourArray[0])))")
        }
    }else{
        print("not valid multi-operand")
    }
}
if CommandLine.arguments.count < 2 {
    // Expecting a string but didn't receive it
}
else {
    let arg = CommandLine.arguments
    processMultiOperator(arg : [String](arg))
    exit(0)
}
while(true){
    print("Enter an expression separated by returns:")
    let request1 = readLine(strippingNewline: true)
    let number1 = Double(request1!);
    if(number1 != nil){
        let mathOperator = readLine(strippingNewline: true)
        let number2 = Double(readLine(strippingNewline: true)!)
        if(mathOperator != nil && (mathOperator == "+" || mathOperator == "-" || mathOperator == "*" || mathOperator == "/" || mathOperator == "%")){
            if(number2 != nil){
                var cake : String = "\(number1!)" + mathOperator! + "\(number2!) "
                let expression = NSExpression(format:cake)
                if let result = expression.expressionValue(with: nil, context: nil) as? NSNumber {
                    print("Result: \(result)")
                } else {
                    print("error evaluating expression")
                }
            }else{
                print("second number is not valid")
            }
        }else{
            print("math operator is either empty or invalid");
        }
    }else{
        var arg = request1!.characters.split{$0 == " "}.map(String.init)
        processMultiOperator(arg : [String](arg))
    }
}
