//
//  SwiftUIViewsUsingCustomBindingsBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Jason Dhindsa on 2024-02-19.
//

// Tutorial: https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-custom-bindings

import SwiftUI

struct SwiftUIViewsUsingCustomBindingsBootcamp: View {
	@State private var name = ""
	var body: some View {
		let binding = Binding(
			get: { self.name },
			set: { self.name = $0 }
		)
		VStack {
			// 😇 The custom binding passed into the TextField is bound to the @State property of this view (ie. name)
			Text("You entered: \(name)")
			HStack {
				// Tip: When binding to a custom Binding instance, you don’t need to use the dollar sign before the binding name – you’re already reading the two-way binding.
				TextField("Your name is: ", text: binding)
			}
			.padding()
		}
	}
}

#Preview {
	SwiftUIViewsUsingCustomBindingsBootcamp()
}
