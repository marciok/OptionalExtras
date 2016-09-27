//
//  OptionalExtras.swift
//  Pods
//
//  Created by Marcio Klepacz on 9/26/16.
//
//

import Foundation

public extension Optional {
    
    func expect(_ desrcription: String) -> Wrapped {
        guard let val = self else  {  fatalError(desrcription)   }
        
        return val;
    }
    
    func unwrapOr(_ def: Wrapped) -> Wrapped {
        return self ?? def
    }
    
    func unwrapOrElse(_ f: () -> Wrapped) -> Wrapped {
        return self.unwrapOr(f())
    }
    
    func isNone() -> Bool {
        return self == nil;
    }
    
    func isSome() -> Bool {
        return !isNone();
    }
    
    func mapOr<T>(_ def: T, _ f: (Wrapped) -> T) -> T {
        guard let val = self else { return def }
        
        return f(val)
    }
    
    func mapOrElse<T>(_ def: () -> T, _ f: (Wrapped) -> T) -> T {
        guard let val = self else  { return def() }
        
        return f(val)
    }
    
    func and(_ optb: Optional) -> Optional {
        if self.isSome() && optb.isSome() { return optb }
        
        return nil;
    }
    
    func or(_ optb: Optional) -> Optional {
        if self.isSome() {
            return self;
        }
        
        if optb.isSome() {
            return optb
        }
        
        return nil;
    }
    
    func orElse(_ f: () -> Optional) -> Optional {
        let res = f();
        
        if self.isNone() && res.isSome() {
            return res;
        }
        
        return self;
    }
    
}
