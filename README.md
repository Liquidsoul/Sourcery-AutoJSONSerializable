Sourcery AutoJSONSerialization
==============================

This is my attempt to implement some [Sourcery](https://github.com/krzysztofzablocki/Sourcery) templates which automatically generates JSON bindings for your `struct`s and `classes`.  

[![Build Status](https://travis-ci.org/Liquidsoul/Sourcery-AutoJSONSerializable.svg?branch=master)](https://travis-ci.org/Liquidsoul/Sourcery-AutoJSONSerializable)
[![codecov](https://codecov.io/gh/Liquidsoul/Sourcery-AutoJSONSerializable/branch/master/graph/badge.svg)](https://codecov.io/gh/Liquidsoul/Sourcery-AutoJSONSerializable)
[![Version](http://cocoapod-badges.herokuapp.com/v/Sourcery-AutoJSONSerializable/badge.png)](http://cocoapods.org/pods/Sourcery-AutoJSONSerializable)

My objective here is to provide a fully tested code generation template that will let you skip the pain of writing this code:

``` swift
extension Contact: JSONDeserializable {
    enum Fields: String {
        case identifier = "id"
        case firstName = "first_name"
        case lastName = "last_name"
        case age = "age"
    }

    init?(JSONObject: Any) {
        guard let JSONObject = JSONObject as? [String: Any],
              let let id = JSONObject[Fields.identifier.rawValue] as? String,
              let firstName = JSONObject[Fields.firstName.rawValue] as? String,
              let lastName = JSONObject[Fields.lastName.rawValue] as? String,
              let age = JSONObject[Fields.age.rawValue] as? Int
            else {
                return nil
        }
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
}
```

# Usage #

The JSON serialization/deserialization is based on two protocols.  

``` swift
protocol JSONDeserializable {
    init?(JSONObject: Any)
}

protocol JSONSerializable {
    func toJSONObject() -> Any
}
```

With this tool, you do not need to implement these protocols, the Sourcery templates will do the boiler plate code for you.  
To do this, all you need to do is add sourcery annotations to you `struct`s:

``` swift
// sourcery: AutoJSONSerializable, AutoJSONDeserializable
struct Contact {
    // ...
}
```

And then run Sourcery using the templates found in the `Templates/` folder of this repository.

## Example ##

Let say you have a model struct like this one:

``` swift
struct Contact {
    let id: String
    let firstName: String
    let lastName: String
    let age: Int
}
```

Adding the `AutoJSONDeserializable` annotation would make it initializable from this JSON data:

``` json
{
  "id": "SomeID",
  "firstName": "John",
  "lastName": "Doe'"
}
```

# Features #

  * Primitive JSON types (String, Int, Double).
  * `RawRepresentable` enums.
  * Any type implementing `JSONSerializable`/`JSONDeserializable`.
  * Optionals.
  * Nested structures.
  * Nested types with custom `JSONSerializable` or `JSONDeserializable` implementation.
  * Arrays of primitive JSON types, `enum`s and JSON*able types.
  * JSONKey annotation.
  
⚠️ This system does not support `class` types because an extension can only declare `convenience` initializers ⚠️

⚠️ `Date`s are not supported out of the box anymore ⚠️ 

Because _almost_ every project use a different date format to communicate with the server the embedded implementation has been removed. You can support `Date`s by providing your implementation.  
However, you can still find an implementation for `Date`s Serialization/Deserialization using `ISO8601DateFormatter` with milliseconds support in the testing code [here](https://github.com/Liquidsoul/Sourcery-AutoJSONSerializable/blob/master/Sources/AutoJSONSerialization/Date%2BJSONSerialization.swift).

## Attributes annotations ##

When mapping your JSON to your model structure, you may sometimes want to use a different attribute name as the one in the JSON file.  
Let's say you have this JSON:

``` json
{
  "id": "SomeID",
  "first_name": "John",
  "last_name": "Doe'"
}
```

As you can see, the naming convention does not follow camel case. To fix this you can use Sourcery annotations.  
On a property, you can define the `JSONKey` attribute with the JSON name you want to bind the property to:

``` swift
struct Contact {
    let id: String
    // sourcery: JSONKey = "first_name"
    let firstName: String
    // sourcery: JSONKey = "last_name"
    let lastName: String
}
```

## Custom JSON*able Implementation ##

If you want to nest some types that are not supported out of the box (e.g. `enum`s with associated values) or if you want to provide a special implementation of the serde methods for those types, you can simply implement the `JSONSerializable` and/or `JSONDeserializable` protocols.

For example, if `Job` is an enum, you can still add it to `Contact`:

``` swift
struct Contact {
    let id: String
    let job: Job
}

enum Job: JSONSerializable {
    […]

    func toJSONObject() -> Any {
        // Implemnt your custom serializer.
    }
}
```

You can find some examples in the models I use to test the library in [`Sources/AutoJSONSerialization/Models/`](https://github.com/Liquidsoul/Sourcery-AutoJSONSerializable/tree/master/Sources/AutoJSONSerialization/Models).

# Installation #

## With CocoaPods ##

Add `pod 'Sourcery-AutoJSONSerializable'` to your [Podfile](https://guides.cocoapods.org/using/using-cocoapods.html).

Configure your `.sourcery.yml` file with this:

``` yaml
[…]
templates:
  - Pods/Sourcery-AutoJSONSerializable/Templates/
  […]
```

And, to use it on a structure, just add one of the "Auto" annotation:

``` swift
// sourcery: AutoJSONSerializable
struct Contact {
    [...]
}
```

This will generate two files to add to your project:
- `AutoJSONSerializable.generated.swift`
- `AutoJSONDeserializable.generated.swift`

You can specify the output folder for these files using the `output` option in your `.sourcery.yml`. See [Soucery documentation](https://github.com/krzysztofzablocki/Sourcery#configuration-file) for more details.

If you want to provide custom `JSONSerializable` or `JSONDeserializable` implementations, just import the module `Sourcery_AutoJSONSerializable` to gain access to the protocols.

## Manual Install ##

To install just copy the following source files in your project:
  * `Sources/AutoJSONSerialization/JSONSerializable.swift`
  * `Sources/AutoJSONSerialization/JSONDeserializable.swift`

And then copy the Templates files and configure Sourcery.

# Development #

This library uses the Swift Package Manager to build the code with a Sourcery pre-build step described using a `Makefile`.  
You can find all the possible build rules using the command `make help`.

## Pod deployment ##

We offer a cocoapods installation which involves several steps to deliver new versions of the library.  
This process is automated using `fastlane` and can be accessed using `make`. Here it what it'll do:

1. bump the podspec version and commit the change to the repository
2. create the corresponding tag
3. push the new version to github and to `cocoapods` trunk
