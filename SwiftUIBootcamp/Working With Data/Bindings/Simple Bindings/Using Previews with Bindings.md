#  An explanation of using Bindings in Previews

If you have a subview that contains a `@Binding`, you can easily test that Binding in the canvas by using a Preview that passes a `@State` property into that subview.

For example:
```
#Preview("EditNameSubview", traits: .sizeThatFitsLayout, body: {
	@State var name = "Jason Dhindsa"
	return EditNameSubview(name: $name)
})
```

**Note** it is important to return the subview within the Preview's `body` closure.

![Example of using Bindings in Previews](https://raw.github.com/jdhindsa/SwiftUIBootcamp/main/SwiftUIBootcamp/Screenshot/using_previews_with_bindings)
