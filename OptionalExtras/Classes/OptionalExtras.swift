//
//  OptionalExtras.swift
//  Pods
//
//  Created by Marcio Klepacz on 9/26/16.
//
//

import Foundation

public extension Optional {
    
    /**
     Unwraps an option, yielding the content of a .some.
     Or throws `fatalError` with given description
     
     */
    func expect(_ description: String) -> Wrapped {
        guard let val = self else  { fatalError(description) }
        
        return val;
    }
    
    /**
     Returns the contained value or a default.
     */
    func unwrapOr(_ def: Wrapped) -> Wrapped {
        return self ?? def
    }
    
    /**
     Returns the contained value or computes it from a closure.
     */
    func unwrapOrElse(_ f: () -> Wrapped) -> Wrapped {
        return self.unwrapOr(f())
    }

    /**
     Returns true if the `Optional` is nil
     */
    func isNone() -> Bool {
        return self == nil;
    }
    
    /**
     Returns true if the `Optional` is .some
     */
    func isSome() -> Bool {
        return !isNone();
    }
    
    /**
     Applies a function to the contained value (if any), or returns a default (if not).
     */
    func mapOr<T>(_ def: T, _ f: (Wrapped) -> T) -> T {
        guard let val = self else { return def }
        
        return f(val)
    }
    
    /**
     Applies a function to the contained value (if any), or computes a default (if not).
     */
    func mapOrElse<T>(_ def: () -> T, _ f: (Wrapped) -> T) -> T {
        guard let val = self else  { return def() }
        
        return f(val)
    }
    
    /**
     Returns .none if the `Optional` is nil, otherwise returns optb.
     */
    func and(_ optb: Optional) -> Optional {
        if self.isSome() && optb.isSome() { return optb }
        
        return nil;
    }
    
    /**
     Returns nil if the `Optional` is .none, otherwise returns optb.
     */
    func or(_ optb: Optional) -> Optional {
        if self.isSome() {
            return self;
        }
        
        if optb.isSome() {
            return optb
        }
        
        return nil;
    }
    
    /**
     Returns the `Optional` if it contains a value, otherwise calls f and returns the result.
     */
    func orElse(_ f: () -> Optional) -> Optional {
        let res = f();
        
        if self.isNone() && res.isSome() {
            return res;
        }
        
        return self;
    }
    
}
