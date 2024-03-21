//
//  ChildViewsUsingCustomBindings.swift
//  SwiftUIBootcamp
//
//  Created by Jason Dhindsa on 2024-02-19.
//

// Tutorial: https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-custom-bindings

import SwiftUI

struct ChildViewsUsingCustomBindingsBootcamp: View {
	@State private var name = ""
	var body: some View {
		let binding = Binding(
			get: { self.name },
			set: { self.name = $0 }
		)
		
		Text("Hello, welcome to the Custom Binding demo!")
		// Tip: When binding to a custom Binding instance, you don’t need to use the dollar sign before the binding name – you’re already reading the two-way binding.
		ChildView(name: binding)
		Text("Parent View: \(name)")
	}
}

struct ChildView: View {
	@Binding var name: String
	var body: some View {
		VStack {
			Text("Child View: \(name)")
		}
		.onAppear {
			name = "Par-cutie"
		}
	}
}

#Preview {
	ChildViewsUsingCustomBindingsBootcamp()
}
