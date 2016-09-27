# OptionalExtras

[![CI Status](http://img.shields.io/travis/Marcio Klepacz/OptionalExtras.svg?style=flat)](https://travis-ci.org/marciok/OptionalExtras)
[![Version](https://img.shields.io/cocoapods/v/OptionalExtras.svg?style=flat)](http://cocoapods.org/pods/OptionalExtras)
[![License](https://img.shields.io/cocoapods/l/OptionalExtras.svg?style=flat)](http://cocoapods.org/pods/OptionalExtras)
[![Platform](https://img.shields.io/cocoapods/p/OptionalExtras.svg?style=flat)](http://cocoapods.org/pods/OptionalExtras)

Handful of functions that will help you work with `Optional` types. 100% inspired by [std::option - Rust](https://doc.rust-lang.org/std/option/)

## Examples

### expect(_ desrcription: String) -> Wrapped
Unwraps an `Optional`, yielding the content of a .some. Or throws `fatalError` with given description
```swift
let x: String? = nil
x.expect("the world is ending")
```

### unwrapOr(_ def: Wrapped) -> Wrapped
Returns the contained value or a default.
````swift
let x: Int? = nil
let r = x.unwrapOr(20) // r == 20
```

### unwrapOrElse(_ f: () -> Wrapped) -> Wrapped
Returns the contained value or computes it from a closure.
````swift
let x: Int? = nil
let r = x.unwrapOrElse { 2 * 2 } // r == 4
```

### isNone() -> Bool
Returns true if the `Optional` is nil
````swift
let x: String? = nil
let r = x.isNone() // r == true
```

### isSome() -> Bool
Returns true if the `Optional` is .some
````swift
let x: String? = "foo"
let r = x.isSome() // r == true
```

### mapOr\<T>\(_ def: T, _ f: (Wrapped) -> T) -> T
Applies a function to the contained value (if any), or returns a default (if not).
```swift
let x: String? = "foo"
let r = x.mapOr(42) { (v: String) -> Int in
   v.characters.count
} // r == 3
```

### mapOrElse\<T>\(_ def: () -> T, _ f: (Wrapped) -> T) -> T {
Applies a function to the contained value (if any), or computes a default (if not).
```swift
let x: String? = nil
let r = x.mapOrElse({
    3 * 3
},
{ (v: String) -> Int in
    v.characters.count
}) // r == 9
```

### and(_ optb: Optional) -> Optional
Returns .none if the `Optional` is nil, otherwise returns optb.
```swift
let x: Int? = 10
let y: Int? = nil

let r = x.and(y) // r == nil
```

### or(_ optb: Optional) -> Optional
Returns nil if the `Optional` is .none, otherwise returns optb.
```swift
let x: Int? = 18
let y: Int? = 10
let r = x.or(y) // r == 18
```

### orElse(_ f: () -> Optional) -> Optional
Returns the `Optional` if it contains a value, otherwise calls f and returns the result.
```swift
let x: String? = nil
let r = x.orElse { "foo" } // r! == "foo"
```

## Requirements

## Installation

OptionalExtras is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "OptionalExtras"
```

## Author

Marcio Klepacz, marcioklepacz@gmail.com

## License

OptionalExtras is available under the MIT license. See the LICENSE file for more info.
