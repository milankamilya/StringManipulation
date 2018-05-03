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
  
  
  /// To mention a person and tag anybody, we need to search through the text. For that we need
  /// the key (i.e. @ for mention, # hashtag) and present Index of caret.
  ///
  /// - Parameters:
  ///   - key: Character, (i.e. @, #, ! etc)
  ///   - from: present String.Index of caret
  /// - Returns: (searchString: String, searchRange: Range<String.Index>) searchString will be useful to display autocomplete table. the searchRange will be needed at the time of replacing with actual/ complete text/string from autocomplete table. So, please send searchRange back while replacing the text that will improve performance of the app.
  func search(key: Character, from: String.Index) -> (searchString: String, searchRange: Range<String.Index>)? {
    
    let startIndex = self.startIndex
    let whitespaces = CharacterSet.whitespacesAndNewlines
    
    var keyIndex: String.Index? = nil
    var iteratorIndex = from
    while (true) {
      
      let newIndex = index(before: iteratorIndex)
      let character = self[newIndex]
      
      if String(character).rangeOfCharacter(from:whitespaces) != nil {
        keyIndex = index(after: newIndex)
        break
      } else if newIndex == startIndex {
        keyIndex = newIndex
        break
      } else {
        iteratorIndex = newIndex
      }
    }
    
    if let keyIndex = keyIndex {
      let kIndex = index(after: keyIndex)
      
      if self[keyIndex] == key {
        
        // let range = keyIndex..<from
        let searchRange = kIndex..<from
        let searchString = self[searchRange]
        return (searchString, searchRange)
        
      } else {
        return nil
      }
      
    } else {
      return nil
    }
    
  }
  
  
  /// To replace the specific range of the String with a string from autocomplete text.
  ///
  /// - Parameters:
  ///   - searchRange: Range<String.Index> It is already given to you while you called search(key:from:) method
  ///   - with: String which will be replaced with
  /// - Returns: SelectedIndex will be return, please use it set selectedIndex which will move the caret to exact position.
  func replace(searchRange: Range<String.Index>, with: String) -> (text:String, selectedIndex:String.Index)? {
    //TODO:- change return documentation
    //TODO:- Check searchRange & with are valid, else return nil
    
    
    var text = self
    text.replaceSubrange(searchRange, with: with)
    var selectedIndex = text.endIndex
    
    // If the range is empty, then additional 1 need to be added for index correction
    let indexCorrection = searchRange.isEmpty ? 1 : 0
    
    if let sIndex = text.index( searchRange.lowerBound,
                                offsetBy: with.characters.count + indexCorrection,
                                limitedBy: text.characters.endIndex) {
      selectedIndex = sIndex
    }
    
    return (text: text, selectedIndex: selectedIndex)
  }
}
