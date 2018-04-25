/*
     MIT License
     
     Copyright (c) 2018 Milan Kamilya
     
     Permission is hereby granted, free of charge, to any person obtaining a copy
     of this software and associated documentation files (the "Software"), to deal
     in the Software without restriction, including without limitation the rights
     to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
     copies of the Software, and to permit persons to whom the Software is
     furnished to do so, subject to the following conditions:
     
     The above copyright notice and this permission notice shall be included in all
     copies or substantial portions of the Software.
     
     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
     IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
     FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
     AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
     LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
     OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
     SOFTWARE.
 */

import XCTest
@testable import StringManipulation

class StringManipulationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
      
      
      
      // TEST CASE 1
      let t1 = "@"
      if let r1 = t1.search(key: "@", from: t1.endIndex) {
        XCTAssert(r1.searchString == "")
      } else { XCTAssert(false) }
      
      
      // TEST CASE 2
      let t2 = "@Mil"
      if let r2 = t2.search(key: "@", from: t2.endIndex) {
        XCTAssert(r2.searchString == "Mil")
      } else { XCTAssert(false) }
      
      
      // TEST CASE 3
      let t3 = "Hello @Mil"
      if let r3 = t3.search(key: "@", from: t3.endIndex) {
        XCTAssert(r3.searchString == "Mil")
      } else { XCTAssert(false) }
      
      
      // TEST CASE 4
      let t4 = "Hello \n@Mil"
      if let r4 = t4.search(key: "@", from: t4.endIndex) {
        XCTAssert(r4.searchString == "Mil")
      } else { XCTAssert(false) }
      
      
      // TEST CASE 5
      let t5 = "Hello@Mil"
      if let _ = t5.search(key: "@", from: t5.endIndex) {
        XCTAssert(false)
      } else {
        XCTAssert(true)
      }
      
      
      // TEST CASE 6
      let t6 = "Hello there @"
      if let r6 = t6.search(key: "@", from: t6.endIndex) {
        XCTAssert(r6.searchString == "")
      } else { XCTAssert(false) }
      
      
      // TEST CASE 7
      let t7 = "Hello @there "
      if let r7 = t7.search(key: "@", from: t7.index(t7.startIndex, offsetBy: 8)) {
        XCTAssert(r7.searchString == "t")
      } else { XCTAssert(false) }
      
      // TEST CASE 8
      let t8 = "hello @alejandro 😆👊🏻✊🏿🍣🇩🇪 I am in love @with you "
      if let r8 = t8.search(key: "@", from: t8.index(t8.startIndex, offsetBy: 10)) {
        XCTAssert(r8.searchString == "ale")
      } else { XCTAssert(false) }
      
      if let r9 = t8.search(key: "@", from: t8.index(t8.endIndex, offsetBy: -6)) {
        XCTAssert(r9.searchString == "wit")
      } else { XCTAssert(false) }
      
      
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
