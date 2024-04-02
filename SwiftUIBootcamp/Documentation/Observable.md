#  Observable

** NOTE ** The `@Observable` macro is only available in iOS 17 and above.

## Documentation
[Observation Framework](https://developer.apple.com/documentation/observation)
[Observable Protocol](https://developer.apple.com/documentation/observation/observable#)
[Bindable Property Wrapper](https://developer.apple.com/documentation/swiftui/bindable#)

## 1 way bindings vs 2 way bindings

### 1 way bindings

In order to setup a 1-way binding, there are a few requirements:
1) Import the `Observation` protocol on the class you want to observe.
2) Add the `@Observable` macro to the class that you want to observe.
3) Any properties within the class that are **not** marked as `private` will be automatically monitored for changes by the Observation framework.
4) Pass the class into any subview that requires it (no need to use the `$` prefix)

For example, here is a class defined with the `@Observable` protocol:

```
@Observable
class BabyClass {
	var name = "N/A"
	var age = 0
}
```

In `BabyClass`, both `name` and `age` are observable.

In the view that should contain the instance of the `BabyClass`, we simply declare a private variable that is an instance of that type (**note**, we don't use any property wrappers here)

```
struct OneWayBindingWithAnObservableClass: View {
	private var babyClass = BabyClass() // 😇 <- look at me!
	
	var body: some View {
		VStack {
			Button("Add Baby Info") {
				babyClass.name = "Liam Dhindsa"
				babyClass.age = 3
			}
			.buttonStyle(.bordered)
			
			GroupBox("Baby Info") {
				Text("\(babyClass.name) - \(babyClass.age)")
			}
		}
		.font(.title)
	}
}
```

### 2 way bindings

For a 2 way binding, the requirements change likely:
1) Import the `Observation` protocol on the class you want to observe.
2) Add the `@Observable` macro to the class that you want to observe.
3) Any properties within the class that are **not** marked as `private` will be automatically monitored for changes by the Observation framework.
4) In the view that contains the class, declare the instance with the `@State` property wrapper.
5) Pass the class into any subview that requires it (no need to use the `$` prefix).

For point # 4, our view would now look like this:
```
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
```

Now, `babyClass` is a 2 way binding with any subview that it is passed into (ie. such as the TextField)

## Summary of @Observable
![Summary of @Observable](https://raw.github.com/jdhindsa/SwiftUIBootcamp/main/SwiftUIBootcamp/Screenshot/summary_of_observable.png)
