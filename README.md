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

    init?(JSONObject: [String : Any]) {
        guard let id = JSONObject[Fields.identifier.rawValue] as? String,
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
    init?(JSONObject: [String: Any])
}

protocol JSONSerializable {
    func toJSONObject() -> [String: Any]
}
```

With this tool, you do not need to implement these protocols, the Sourcery templates will do the boiler plate code for you.  
To do this, all you need to do is conform to one (or both) of these protocols:

``` swift
protocol AutoJSONDeserializable {}

protocol AutoJSONSerializable {}
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

Making it conform to AutoJSONDeserializable would result make it support this JSON:

``` json
{
  "id": "SomeID",
  "firstName": "John",
  "lastName": "Doe'"
}
```

# Features #

  * Primitive JSON types (String, Int, Double).
  * ISO8601 formatted dates.
  * Optionals.
  * Nested structures.
  * Nested types with custom JSONSerializable or JSONDeserializable implementation.
  * JSONKey annotation.
  * Arrays of primitive JSON types, `Date`s and JSON*able types.

## Annotations ##

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

If you want to nest some types that are not currently supported (for example: enums with associated values) or if you want to provide a special implementation of the serde methods for those types, you can simply implement the `JSONSerializable` and/or `JSONDeserializable` protocols.

For example, if `Job` is an enum, you can still add it to `Contact`:

``` swift
struct Contact {
    let id: String
    let job: Job
}

enum Job: JSONSerializable {
    […]

    func toJSONObject() -> [String: Any] {
        // Implemnt your custom serializer.
    }
}
```

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

Add those protocols anywhere in your source code:

``` swift
protocol AutoJSONSerializable {}
protocol AutoJSONDeserializable {}

public protocol JSONSerializable {
    func toJSONObject() -> [String: Any]
}

protocol JSONDeserializable {
    init?(JSONObject: [String: Any])
}
```

And, finally, to use it on a structure, just add one of the "Auto" protocols:

``` swift
struct Contact: AutoJSONSerializable {
    [...]
}
```

## Manual Install ##

To install just copy the following source files in your project:
  * `Sources/AutoJSONSerialization/AutoJSONSerializable.swift`
  * `Sources/AutoJSONSerialization/AutoJSONDeserializable.swift`

And then copy the Templates files and configure Sourcery.
