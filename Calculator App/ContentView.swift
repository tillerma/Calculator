//
//  ContentView.swift
//  Calculator App
//
//  Created by Mary Tiller on 1/6/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var CurrentValue = "0"
    @State var valueA : Double = 0.0
    @State var baseNum : Double = 0.0
    @State var secondary = false
    @State var signHit = false
    @State var add = false
    @State var multiply = false
    @State var subtract = false
    @State var divide = false
    @State var signChange = false
    @State var square = false
    @State var squareRoot = false
    @State var integerUse = false
    @State var decimalHit = false
    
    var body: some View {
        
        ZStack {
            
            Image("Background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
                VStack(
                alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/,
                spacing: 5.0) {
                    
                    ZStack {
                        Image("Number Bar")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10.0)
                        
                        Text(CurrentValue)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.trailing)
                            .lineLimit(1)
                        
                    }
                    
                    HStack(alignment: .center, spacing: 5.0) {
                        
                        Button {
                            valueA = 0 - valueA
                            updateCVReg()
                        } label: {
                            Image("Negative")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10.0)
                        }
                        
                        Button {
                            if valueA < 0 {
                                CurrentValue = "Invalid, try again"
                            }
                            else {
                                valueA = sqrt(valueA)
                                updateCVReg()
                            }
                        } label: {
                            Image("SquareRoot")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10.0)
                        }
                        
                        Button {
                            valueA = valueA * valueA
                            updateCVReg()
                        } label: {
                            Image("Squared")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10.0)
                        }
                        
                        Button {
                            
                        } label: {
                            Image("One")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10.0)
                        }
                    }
                    
                    HStack(alignment: .center, spacing: 5.0) {
                        
                        Button {
                            changeA(numA: 1)
                            updateCVReg()
                        } label: {
                            Image("One")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10.0)
                        }
                        
                        Button {
                            changeA(numA: 2)
                            updateCVReg()
                        } label: {
                            Image("Two")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10.0)
                        }
                        
                        Button {
                            changeA(numA: 3)
                            updateCVReg()
                        } label: {
                            Image("Three")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10.0)
                        }
                        
                        Button {
                            if signHit == true {
                                equals()
                            }
                            divide = true
                            signHit = true
                            numFuncHit()
                        } label: {
                            Image("Divide")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10.0)
                        }
                    }
                    
                    HStack(alignment: .center, spacing: 5.0) {
                        
                        Button {
                            changeA(numA: 4)
                            updateCVReg()
                        } label: {
                            Image("Four")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10.0)
                        }
                        
                        Button {
                            changeA(numA: 5)
                            updateCVReg()
                        } label: {
                            Image("Five")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10.0)
                        }
                        
                        Button {
                            changeA(numA: 6)
                            updateCVReg()
                        } label: {
                            Image("Six")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10.0)
                        }
                        
                        Button {
                            if signHit == true {
                                equals()
                            }
                            multiply = true
                            signHit = true
                            numFuncHit()
                        } label: {
                            Image("Times")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10.0)
                        }
                    }
                    
                    HStack(alignment: .center, spacing: 5.0) {
                        
                        Button {
                            changeA(numA: 7)
                            updateCVReg()
                        } label: {
                            Image("Seven")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10.0)
                        }
                        
                        Button {
                            changeA(numA: 8)
                            updateCVReg()
                        } label: {
                            Image("Eight")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10.0)
                        }
                        
                        Button {
                            changeA(numA: 9)
                            updateCVReg()
                        } label: {
                            Image("Nine")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10.0)
                        }
                        
                        Button {
                            if signHit == true {
                                equals()
                            }
                            subtract = true
                            signHit = true
                            numFuncHit()
                        } label: {
                            Image("Minus")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10.0)
                        }
                    }
                    
                    
                    HStack(alignment: .center, spacing: 5.0) {
                        
                        Button {
                            CurrentValue = String(Double(valueA))
                            decimalHit = true
                        } label: {
                            Image("Decimal")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10.0)
                        }
                        
                        Button {
                            changeA(numA: 0)
                            updateCVReg()
                        } label: {
                            Image("Zero")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10.0)
                        }
                        
                        Button {
                            equals()
                            signHit = false
                        } label: {
                            Image("Equals")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10.0)
                        }
                        
                        Button {
                            if signHit == true {
                                equals()
                            }
                            add = true
                            signHit = true
                            numFuncHit()
                        } label: {
                            Image("Plus")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10.0)
                        }
                    }
                    
                    HStack(alignment: .center, spacing: 5) {
                        
                        Button {
                            resetFunc()
                        } label: {
                            Image("Clear")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10.0)
                            
                        }
                        
                    }.containerRelativeFrame(.horizontal, count: 6, span: 2, spacing: 5.0)
                    
                   
                    
                } .containerRelativeFrame(.horizontal, count: 5, span: 3, spacing: 5.0)
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
            
           
            
            
        }
        
    }
    
    func resetFunc() {
        CurrentValue = "0"
        secondary = false
        valueA = 0
        baseNum = 0
        secondary = false
        signHit = false
        add = false
        multiply = false
        subtract = false
        divide = false
        signChange = false
        square = false
        squareRoot = false
        integerUse = false
    }
    
    func changeA(numA: Double) {
        if secondary == true {
           valueA = valueA * 10
        }
        
        valueA = valueA + numA
        secondary = true
    }
    
    func updateCVReg() {
        if (Int(valueA * 10) % 10 == 0) {
            CurrentValue = String(Int(valueA))
        }
        else {
            CurrentValue = String(valueA)
        }
    }
    
    func equals() {
        
        if add {
            baseNum = valueA + baseNum
            add = false
        }
        
        else if multiply {
            baseNum = valueA * baseNum
            multiply = false
        }
        
        else if subtract {
            baseNum = baseNum - valueA
            subtract = false
        }
        
        else if divide {
            if valueA == 0 {
                CurrentValue = "Invalid, try again"
                
            }
            else {
                baseNum = baseNum / valueA
                divide = false
            }
        }
        
        else {
            baseNum = valueA
        }
        
        decimilize()
        
        if (!integerUse) {
            CurrentValue = String(baseNum)
        }
        else {
            CurrentValue = String(Int(baseNum))
            integerUse = false
        }
        
    }
    
    func numFuncHit() {
        baseNum = valueA
        valueA = 0
    }
    
    func decimilize() {
        @State var temp = baseNum * 10
        if (Int(temp) % 10 == 0) {
            integerUse = true
        }
    }
    
}

#Preview {
        ContentView()
}
