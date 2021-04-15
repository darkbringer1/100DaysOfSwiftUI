//
//  ContentView.swift
//  Project 1 WeSplit
//
//  Created by DarkBringer on 15.04.2021.
//

import SwiftUI

struct ContentView: View {
	// MARK: - PROPERTIES
	@State private var checkAmount = ""
	@State private var numberOfPeople = 2
	@State private var tipPercentage = 2
	
	let tipPercentages = [0, 10, 15, 20, 25]
	
	var totalPerPerson: Double {
		let peopleCount = Double(numberOfPeople + 2)
		let tipSelection = Double(tipPercentages[tipPercentage])
		let orderAmount = Double(checkAmount) ?? 0
		
		let tipValue = orderAmount / 100 * tipSelection
		let grandTotal = orderAmount + tipValue
		let amountPerPerson = grandTotal / peopleCount
		
		return amountPerPerson
	}
	
	var totalAmount: Double {
		let tipSelection = Double(tipPercentages[tipPercentage])
		let orderAmount = Double(checkAmount) ?? 0
		
		let tipValue = orderAmount / 100 * tipSelection
		let grandTotal = orderAmount + tipValue
		
		return grandTotal
	}
	// MARK: - BODY
	
	var body: some View {
		NavigationView {
			Form {
				Section{
					TextField("Amount", text: $checkAmount)
						.keyboardType(.decimalPad)
					Picker("Number of people", selection: $numberOfPeople) {
						ForEach(2..<20) {
							Text("\($0) people")
						}
					}
				}
				Section(header: Text("How much tip do you want to leave?")){
					Picker("Tip percentage", selection: $tipPercentage){
						ForEach(0 ..< tipPercentages.count) {
							Text("\(self.tipPercentages[$0])%")
						}
					}
					.pickerStyle(SegmentedPickerStyle())
				}
				Section(header: Text("Total per person")){
					Text("$\(totalPerPerson, specifier: "%.2f")")
				}
				Section(header: Text("Total bill")) {
					Text("$\(totalAmount, specifier: "%.2f")")
				}
			} //: FORM
			.navigationBarTitle(Text("WeSplit"), displayMode: .large)
		}//:NAV VIEW
	}
}
// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
