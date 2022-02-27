//
//  ContentView.swift
//  Body Mass Index Calculator
//
//  Created by Дмитрий Поздняков on 27.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var weightText: String = ""
    @State private var heightText: String = ""
    @State private var bmi: Double = 0
    @State private var classification: String = ""
    
    var body: some View {
        VStack{
                Text("BMI Calculator:")
                    .font(.largeTitle)
                TextField("Enter Weight (in kilograms)", text: $weightText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border(Color.white)
                TextField("Enter Height (in meters)", text: $heightText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border(Color.white)
            
                Button(action:{
                    var weight: Double = 0
                    var height: Double = 0
                    if let weightDouble = Double(self.weightText){
                        weight = weightDouble
                    } else{
                        weight = 1
                    }
                    if let heightDouble = Double(self.heightText){
                        height = heightDouble
                    } else{
                        height = 1
                    }
                    
                    
                    self.bmi = weight/(height * height)
                   
                    if self.bmi < 18.5{
                        self.classification = "Underweight"
                    } else if self.bmi < 24.9{
                        self.classification = "Healthy weight"
                    } else if self.bmi < 29.9{
                        self.classification = "Overweight"
                    } else{
                        self.classification = "Obese"
                    }
                    
                    if weight == 1 || height == 1{
                        self.classification = "wrong input"
                    }
                }){
                    Text("Calculate BMI")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                }
                
                Text("BMI: \(bmi, specifier: "%.1f"),  \(classification)").font(.title).padding()
            }.padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
