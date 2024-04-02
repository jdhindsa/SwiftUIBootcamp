#  Custom Bindings

## What are custom bindings?
A custom binding is an object of type Binding that comes with a `get` and `set` closure.  The syntax of a custom binding is:

```
let binding = Binding(
	get: { 
		// read a local @State property in the view 
	 },
	set: { 
		// set the value of a local @State property and also do some other work before you do that, if required. 
	}
)
```

## Why would we use a custom binding?
A custom binding is useful if you need to do additional things before reading or writing the value of a local @State property.

## A real-life example of using a custom binding

```
import SwiftUI

struct ContentView: View {
    @State private var firstToggle = false
    @State private var secondToggle = false

    var body: some View {
        let firstBinding = Binding(
            get: { self.firstToggle },
            set: {
                self.firstToggle = $0

                if $0 == true {
                    self.secondToggle = false
                }
            }
        )

        let secondBinding = Binding(
            get: { self.secondToggle },
            set: {
                self.secondToggle = $0

                if $0 == true {
                    self.firstToggle = false
                }
            }
        )

        return VStack {
            Toggle(isOn: firstBinding) {
                Text("First toggle")
            }

            Toggle(isOn: secondBinding) {
                Text("Second toggle")
            }
        }
		.padding(.horizontal, 20)
    }
}

```

### GIF showing how the toggles work
