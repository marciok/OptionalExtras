//
//  OptionalExtrasTests.swift
//  OptionalExtras
//
//  Created by Marcio Klepacz on 9/26/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest
import OptionalExtras

class OptionalExtrasTests: XCTestCase {
    
    
    func test_expect_whenIsNotEmpty() {
        //Arrange
        let x: String? = "Value"
        //Act
        let r = x.expect("the world is ending")
        
        //Assert
        XCTAssertEqual(r, "Value")
    }
    
    func test_unwrapOrWhenIsNotEmpty() {
        //Arrange
        let x: Int? = 18
        //Act
        let r = x.unwrapOr(20)
        
        //Assert
        XCTAssertEqual(r, 18)
    }
    
    func test_unwrapOrWhenIsEmpty() {
        //Arrange
        let x: Int? = nil
        //Act
        let r = x.unwrapOr(20)
        
        //Assert
        XCTAssertEqual(r, 20)
    }
    
    func test_unwrapOrElseWhenIsEmpty() {
        //Arrange
        let x: Int? = nil
        
        //Act
        let r = x.unwrapOrElse { 2 * 2 }
        
        //Assert
        XCTAssertEqual(r, 4)
    }
    
    func test_unwrapOrElseWhenIsNotEmpty() {
        //Arrange
        let x: Int? = 18
        
        //Act
        let r = x.unwrapOrElse { 2 * 2 }
        
        //Assert
        XCTAssertEqual(r, 18)
    }
    
    func test_isNoneWhenIsNone() {
        //Arrange
        let x: Int? = nil
        
        //Act
        let r = x.isNone()
        
        //Assert
        XCTAssertTrue(r)
    }
    
    func test_isNoneWhenIsNotNone() {
        //Arrange
        let x: Int? = 18
        
        //Act
        let r = x.isNone()
        
        //Assert
        XCTAssertFalse(r)
    }
    
    func test_isSomeWhenIsSome() {
        //Arrange
        let x: String? = "a"
        
        //Act
        let r = x.isSome()
        
        //Assert
        XCTAssertTrue(r)
    }
    
    func test_isSomeWhenIsNone() {
        //Arrange
        let x: String? = nil
        
        //Act
        let r = x.isSome()
        
        //Assert
        XCTAssertFalse(r)
    }
    
    func test_mapOrWhenIsNotEmpty() {
        //Arrange
        let x: String? = "foo"
        
        //Act
        let r = x.mapOr(42) { (v: String) -> Int in v.characters.count }
        
        //Assert
        XCTAssertEqual(r, 3)
    }
    
    func test_mapOrWhenIsEmpty() {
        //Arrange
        let x: String? = nil
        
        //Act
        let r = x.mapOr(42) { (v: String) -> Int in v.characters.count }
        
        //Assert
        XCTAssertEqual(r, 42)
    }
    
    func test_mapOrElseWhenIsNotEmpty(){
        //Arrange
        let x: String? = "foo"
        
        //Act:
        let r = x.mapOrElse({ 3 * 3}, {(v: String) -> Int in v.characters.count })
        
        //Assert
        XCTAssertEqual(r, 3)
    }
    
    func test_mapOrElseWhenIsEmpty(){
        //Arrange
        let x: String? = nil
        
        //Act:
        let r = x.mapOrElse({ 3 * 3}, {(v: String) -> Int in v.characters.count })
        
        //Assert
        XCTAssertEqual(r, 9)
    }
    
    func test_andWhenBothAreNotEmpty(){
        //Arrange
        let x: Int? = 18
        let y: Int? = 20
        
        //Act:
        let r = x.and(y)
        
        //Assert
        XCTAssertEqual(r!, 20)
    }
    
    func test_andWhenBothAreEmpty(){
        //Arrange
        let x: Int? = nil
        let y: Int? = nil
        
        //Act:
        let r = x.and(y)
        
        //Assert
        XCTAssertNil(r)
    }
    
    func test_andWhenFirstIsEmpty(){
        //Arrange
        let x: Int? = nil
        let y: Int? = 18
        
        //Act:
        let r = x.and(y)
        
        //Assert
        XCTAssertNil(r)
    }
    
    func test_andWhenSecondIsEmpty(){
        //Arrange
        let x: Int? = 10
        let y: Int? = nil
        
        //Act:
        let r = x.and(y)
        
        //Assert
        XCTAssertNil(r)
    }
    
    func test_OrWhenBothAreEmpty(){
        //Arrange
        let x: Int? = nil
        let y: Int? = nil
        
        //Act:
        let r = x.or(y)
        
        //Assert
        XCTAssertNil(r)
    }
    
    func test_OrWhenBothAreNotEmpty(){
        //Arrange
        let x: Int? = 18
        let y: Int? = 10
        
        //Act:
        let r = x.or(y)
        
        //Assert
        XCTAssertEqual(r, 18)
    }
    
    func test_OrWhenFirstIsEmpty(){
        //Arrange
        let x: Int? = nil
        let y: Int? = 10
        
        //Act:
        let r = x.or(y)
        
        //Assert
        XCTAssertEqual(r, 10)
    }
    
    func test_OrWhenSecondIsEmpty(){
        //Arrange
        let x: Int? = 18
        let y: Int? = nil
        
        //Act:
        let r = x.or(y)
        
        //Assert
        XCTAssertEqual(r, 18)
    }
    
    func test_OrElseWhenIsEmpty(){
        //Arrange
        let x: String? = nil
        
        //Act:
        let r = x.orElse {
            "bar"
        }
        
        //Assert
        XCTAssertEqual(r!, "bar")
    }
    
    func test_OrElseWhenIsNotEmpty(){
        //Arrange
        let x: String? = "foo"
        
        //Act:
        let r = x.orElse { "bar" }
        
        //Assert
        XCTAssertEqual(r!, "foo")
    }
    
    func test_OrElseWhenBothAreEmpty(){
        //Arrange
        let x: String? = nil
        
        //Act:
        let r = x.orElse { nil }
        
        //Assert
        XCTAssertTrue(r.isNone())
    }
    
    func test_OrElseWhenFirstIsEmpty(){
        //Arrange
        let x: String? = nil
        
        //Act:
        let r = x.orElse { "foo" }
        
        //Assert
        XCTAssertEqual(r!, "foo")
    }
}
