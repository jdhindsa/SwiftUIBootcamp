//
//  SimpleBindingBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Jason Dhindsa on 2024-03-21.
//

import SwiftUI

struct SimpleBindingBootcamp: View {
	@State var viewBackgroundColor: Color = .yellow
	@State var buttonBackgroundColor: Color = .green
	@State var buttonBackgroundColor2: Color = .orange
	var body: some View {
		ZStack {
			viewBackgroundColor.edgesIgnoringSafeArea(.all)
			VStack {
				ButtonView(viewBackgroundColor: $viewBackgroundColor,
						   buttonBackgroundColor: $buttonBackgroundColor)
				
				ButtonView2(buttonBackgroundColor: buttonBackgroundColor2)
			}
		}
	}
}

struct ButtonView: View {
	@Binding var viewBackgroundColor: Color
	@Binding var buttonBackgroundColor: Color
	var body: some View {
		Button(action: {
			viewBackgroundColor = viewBackgroundColor == .yellow ? .gray : .yellow
			buttonBackgroundColor = buttonBackgroundColor == .green ? .red : .green
		}, label: {
			Text("Colors change when you click me!")
				.fontWeight(.bold)
				.font(.title)
				.padding()
				.background(buttonBackgroundColor)
				.cornerRadius(40)
				.foregroundColor(.white)
				.padding(10)
				.overlay(
					RoundedRectangle(cornerRadius: 40)
						.stroke(buttonBackgroundColor, lineWidth: 5)
				)
		})
	}
}

struct ButtonView2: View {
	var buttonBackgroundColor: Color
	var body: some View {
		Button(action: {
			// Do something here..
		}, label: {
			Text("Colors DO NOT change when you click me!")
				.fontWeight(.bold)
				.font(.title)
				.padding()
				.background(buttonBackgroundColor)
				.cornerRadius(40)
				.foregroundColor(.white)
				.padding(10)
				.overlay(
					RoundedRectangle(cornerRadius: 40)
						.stroke(buttonBackgroundColor, lineWidth: 5)
				)
		})
	}
}

#Preview {
	SimpleBindingBootcamp()
}
