#  How do Property Wrappers work?

A property wrapper lets you create reusable property wrappers that you can use on your properties.

![How Property Wrappers Work](https://raw.github.com/jdhindsa/SwiftUIBootcamp/main/SwiftUIBootcamp/Screenshot/property_wrappers)

A property wrapper can be used on an:
- enum
- struct
- class
and must include a "wrappedValue" property.

In the example below, you will see that the **@propertyWrapper** is used on a struct. Without this property wrapper (and the **wrappedValue** property), a structs value cannot be changed **AFTER** it is set.

But because this struct is part of a propertyWrapper, the "value" property can be read or written to at any time in the view is contained in.

All we need to do is to declare an instance of this property wrapper like this: 
```
@propertyWrapper var myVar: String
```

**Note**, the type of the property wrapper variable is declared as a String because this property wrapper's "value" variable is a String.
  
Now, with this propertyWrapper you can create properties in your view that would be a struct for any purpose:
```
@propertyWrapper var username: String
@propertyWrapper var combination: String
```

This is similar to the concept of a @State variable.  
