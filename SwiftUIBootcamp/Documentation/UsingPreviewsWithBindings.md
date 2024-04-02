#  An explanation of using Bindings in Previews

If you have a subview that contains a `@Binding`, you can easily test that Binding in the canvas by using a Preview that passes a `@State` property into that subview.

Subview:
```
struct EditNameSubview: View {
	@Binding var name: String
	
    var body: some View {
		GroupBox("Subview") {
			TextField("name", text: $name).textFieldStyle(.roundedBorder)
		}
    }
}
```

Now, we can use a `#Preview` to test that subview and it's `@Binding`:
```
#Preview("EditNameSubview", traits: .sizeThatFitsLayout, body: {
	@State var name = "Jason Dhindsa"
	return EditNameSubview(name: $name)
})
```

**Note** it is important to return the subview within the Preview's `body` closure.
