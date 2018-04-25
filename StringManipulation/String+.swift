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

import Foundation

extension String {
  
  // 1. Find a specific character i.e.  "@"
  //    - move backward till you find a whitespace or startIndex
  //    - take just before character, check whether it match with Key
  // 2. Take range of keyIndex to selectedIndex
  // 3. Send to table for search
  
  func search(key: Character, from: String.Index) -> (searchString: String, searchRange: Range<String.Index>)? {
    
    let startIndex = self.startIndex
    let whitespaces = CharacterSet.whitespacesAndNewlines
    
    var keyIndex: String.Index? = nil
    var iteratorIndex = from
    while (true) {
      
      let newIndex = self.index(before: iteratorIndex)
      let character = self[newIndex]
      print(character)
      if String(character).rangeOfCharacter(from:whitespaces) != nil {
        keyIndex = self.index(after: newIndex)
        break
      } else if newIndex == startIndex {
        keyIndex = newIndex
        break
      } else {
        iteratorIndex = newIndex
      }
    }
    print("-----")
    
    if let keyIndex = keyIndex {
      let kIndex = self.index(after: keyIndex)
      
      if self[keyIndex] == key {
        
        let range = keyIndex..<from
        let searchRange = kIndex..<from
        let searchString = self[searchRange]
        return (searchString, range)
        
      } else {
        return nil
      }
      
    } else {
      return nil
    }
    
  }
  
  
  // Replace the key string to selectedIndex with the selected string from auto complete table
  //
  //func replace(key: Character, from: String.Index, ofself: String, with: String) -> (String, String.Index) {
  //  
  //}
}
