//
//  PropertyWrappersIntro.swift
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
		set { value = String(newValue.prefix(4))} // Takes only the last 4 digits of the assigned string
	}
}

struct PropertyWrappersIntro: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    PropertyWrappersIntro()
}
