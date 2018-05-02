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
      
      // TEST CASE 1
      let t1 = "@"
      if let r1 = t1.search(key: "@", from: t1.endIndex) {
        XCTAssert(r1.searchString == "")
        
        // Replacing
        let name = "Milan Kamilya"
        if let r11 = t1.replace(searchRange: r1.searchRange, with: name) {
          XCTAssert(r11.text == "@Milan Kamilya")
          let sIndex = r11.text.endIndex
          XCTAssert(r11.selectedIndex == sIndex)
        }
        
      } else { XCTAssert(false) }
      
      
      // TEST CASE 2
      let t2 = "@Mil"
      if let r2 = t2.search(key: "@", from: t2.endIndex) {
        XCTAssert(r2.searchString == "Mil")
        
        // Replacing
        let name = "Milan Kamilya"
        if let r = t2.replace(searchRange: r2.searchRange, with: name) {
          XCTAssert(r.text == "@Milan Kamilya")
          let sIndex = r.text.endIndex
          XCTAssert(r.selectedIndex == sIndex)
        }
        
      } else { XCTAssert(false) }
      
      
      // TEST CASE 3
      let t3 = "Hello @Mil"
      if let r3 = t3.search(key: "@", from: t3.endIndex) {
        XCTAssert(r3.searchString == "Mil")
        
        // Replacing
        let name = "Milan Kamilya"
        if let r = t3.replace(searchRange: r3.searchRange, with: name) {
          XCTAssert(r.text == "Hello @Milan Kamilya")
          let sIndex = r.text.endIndex
          XCTAssert(r.selectedIndex == sIndex)
        }
        
      } else { XCTAssert(false) }
      
      
      // TEST CASE 4
      let t4 = "Hello \n@Mil"
      if let r4 = t4.search(key: "@", from: t4.endIndex) {
        XCTAssert(r4.searchString == "Mil")
        
        // Replacing
        let name = "Milan Kamilya"
        if let r = t4.replace(searchRange: r4.searchRange, with: name) {
          XCTAssert(r.text == "Hello \n@Milan Kamilya")
          let sIndex = r.text.endIndex
          XCTAssert(r.selectedIndex == sIndex)
        }
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
        
        // Replacing
        let name = "Milan Kamilya"
        if let r = t6.replace(searchRange: r6.searchRange, with: name) {
          XCTAssert(r.text == "Hello there @Milan Kamilya")
          let sIndex = r.text.endIndex
          XCTAssert(r.selectedIndex == sIndex)
        }
      } else { XCTAssert(false) }
      
      
      // TEST CASE 7
      let t7 = "Hello @there "
      let selectedIndex = t7.index(t7.startIndex, offsetBy: 8)
      if let r7 = t7.search(key: "@", from: selectedIndex) {
        XCTAssert(r7.searchString == "t")
        
        // Replacing
        let name = "Milan Kamilya"
        if let r = t7.replace(searchRange: r7.searchRange, with: name) {
          XCTAssert(r.text == "Hello @Milan Kamilyahere ")
          let sIndex = r.text.index(r.text.index(after: selectedIndex), offsetBy: name.characters.count)
          XCTAssert(r.selectedIndex == sIndex)
        }
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
