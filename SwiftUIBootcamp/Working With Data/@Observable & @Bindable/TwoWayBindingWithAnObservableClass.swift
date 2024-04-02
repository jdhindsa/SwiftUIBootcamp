//
//  TwoWayBindingWithAnObservableClass.swift
//  SwiftUIBootcamp
//
//  Created by Jason Dhindsa on 2024-04-02.
//

import SwiftUI

struct TwoWayBindingWithAnObservableClass: View {
	@State private var babyClass = BabyClass()
	
	var body: some View {
		VStack {
			GroupBox("Baby Info") {
				TextField("name", text: $babyClass.name).textFieldStyle(.roundedBorder)
				Text(babyClass.name)
			}
		}
		.font(.title)
	}
}

#Preview {
    TwoWayBindingWithAnObservableClass()
}
