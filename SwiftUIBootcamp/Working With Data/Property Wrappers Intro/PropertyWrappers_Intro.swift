//
//  PropertyWrappers_Intro.swift
//  SwiftUIBootcamp
//
//  Created by Jason Dhindsa on 2024-03-23.
//

import SwiftUI

@propertyWrapper
struct FourCharacters {
	private var value = ""
	
	var wrappedValue: String {
		get { return value }
		set { value = String(newValue.prefix(4))} // Takes only the first 4 digits of the assigned string
	}
}

struct PropertyWrappers_Intro: View {
	@State private var newPIN = ""
	
    var body: some View {
		VStack(spacing: 20) {
			Text("Property Wrappers - Introduction")
				.font(.largeTitle)
			Text("Property wrappers allow you to add the same logic to multiple properties.")
				.font(.title3)
			
			Text("Old PIN: 1234")
			Text("New PIN: 567890")
			Button("Save PIN") {
				@FourCharacters var newPin: String
				newPin = "567890"
				newPIN = newPin
			}
			Text("Your New PIN: ") + Text(newPIN).bold()
		}
		.font(.title)
    }
}

#Preview {
	PropertyWrappers_Intro()
}
