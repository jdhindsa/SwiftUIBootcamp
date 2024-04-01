#  An explanation of using Bindings in SwiftUI

If a parent view has declared a @State variable and you need to use this variable in a child view, there are a few things to consider.

Let's say the parent view has declared a property to set the view's background color:
```
@State var viewBackgroundColor: Color = .yellow
```

### Consideration # 1:
If the child view needs this data, but does **NOT** change it's value you would simply create a simple variable in the child view to hold this value:
```
struct ButtonView: View {
	var buttonBackgroundColor: Color
	var body: some View {
		// Use the buttonBackgroundColor somewhere in the view.
	}
}
```
Then, the parent view would just pass the @State variable into this child view:
```
struct SimpleBindingBootcamp: View {
	@State var buttonBackgroundColor: Color = .green
	var body: some View {
		ZStack {
			viewBackgroundColor.edgesIgnoringSafeArea(.all)
			VStack {
				ButtonView(buttonBackgroundColor: buttonBackgroundColor)
			}
		}
	}
}
```

There is **no need** to create a @Binding in the child view because the child view is not changing the background color.

### Consideration # 2:
If the child view needs this data and **does** change it's value, you would create a @Binding in the child view and pass in the @State variable to it.
```
struct ButtonView: View {
	@Binding var buttonBackgroundColor: Color
	var body: some View {
		// Use the buttonBackgroundColor somewhere in the view.
	}
}
```
Then, the parent view would just pass the @State variable into this child view:
```
struct SimpleBindingBootcamp: View {
	@State var buttonBackgroundColor: Color = .green
	var body: some View {
		ZStack {
			viewBackgroundColor.edgesIgnoringSafeArea(.all)
			VStack {
				ButtonView(buttonBackgroundColor: $buttonBackgroundColor) // ‼️ Notice the use of `$`
			}
		}
	}
}
```

![1 way versus 2 way bindings](https://raw.github.com/jdhindsa/SwiftUIBootcamp/main/SwiftUIBootcamp/Screenshot/1_way_vs_2_way_bindings.png)

When passing a @State variable into another view and you need to bind it's value, use the `$` symbol before the name of the @State variable
