# OptionalExtras

[![CI Status](http://img.shields.io/travis/Marcio Klepacz/OptionalExtras.svg?style=flat)](https://travis-ci.org/marciok/OptionalExtras)
[![Version](https://img.shields.io/cocoapods/v/OptionalExtras.svg?style=flat)](http://cocoapods.org/pods/OptionalExtras)
[![License](https://img.shields.io/cocoapods/l/OptionalExtras.svg?style=flat)](http://cocoapods.org/pods/OptionalExtras)
[![Platform](https://img.shields.io/cocoapods/p/OptionalExtras.svg?style=flat)](http://cocoapods.org/pods/OptionalExtras)

Handful of functions that will help you work with `Optional` types. 100% inspired by [std::option - Rust](https://doc.rust-lang.org/std/option/)

## Examples

### expect(_ desrcription: String) -> Wrapped
Unwraps an `Optional`, yielding the content of a .some. Or throws `fatalError` with given description

### unwrapOr(_ def: Wrapped) -> Wrapped 
Returns the contained value or a default.

### unwrapOrElse(_ f: () -> Wrapped) -> Wrapped 
Returns the contained value or computes it from a closure.

### isNone() -> Bool
Returns true if the `Optional` is nil

### isSome() -> Bool
Returns true if the `Optional` is .some

### mapOr\<T>\(_ def: T, _ f: (Wrapped) -> T) -> T
Applies a function to the contained value (if any), or returns a default (if not).

### mapOrElse\<T>\(_ def: () -> T, _ f: (Wrapped) -> T) -> T {
Applies a function to the contained value (if any), or computes a default (if not).

### and(_ optb: Optional) -> Optional
Returns .none if the `Optional` is nil, otherwise returns optb.

### or(_ optb: Optional) -> Optional
Returns nil if the `Optional` is .none, otherwise returns optb.

### orElse(_ f: () -> Optional) -> Optional
Returns the `Optional` if it contains a value, otherwise calls f and returns the result.

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
