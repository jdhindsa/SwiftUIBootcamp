//
//  OneWayBindingWithAnObservableClass.swift
//  SwiftUIBootcamp
//
//  Created by Jason Dhindsa on 2024-04-02.
//

import SwiftUI
import Observation

@Observable
class BabyClass {
	var name = "N/A"
	var age = 0
}

struct OneWayBindingWithAnObservableClass: View {
	private var babyClass = BabyClass()
	
	var body: some View {
		VStack {
			Button("Add Baby Info") {
				babyClass.name = "Liam Dhindsa"
				babyClass.age = 3
			}
			.buttonStyle(.bordered)
			
			GroupBox("Baby Info") {
				Text("\(babyClass.name) - \(babyClass.age)")
			}
		}
		.font(.title)
	}
}

#Preview {
	OneWayBindingWithAnObservableClass()
}
