//
//  UsingPreviewsWithBinding.swift
//  SwiftUIBootcamp
//
//  Created by Jason Dhindsa on 2024-04-01.
//

import SwiftUI

struct EditNameSubview: View {
	@Binding var name: String
	
    var body: some View {
		GroupBox("Subview") {
			TextField("name", text: $name).textFieldStyle(.roundedBorder)
		}
    }
}

#Preview("EditNameSubview", traits: .sizeThatFitsLayout, body: {
	@State var name = "Jason Dhindsa"
	return EditNameSubview(name: $name)
})
