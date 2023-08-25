//
//  Int+.swift
//  WritBot
//
//  Created by Macbook 5 on 3/3/23.
//

import Foundation

extension Int {
    
    var textViewText:String {
        return "*\(self)textView*"
    }
    
    var toEng:String {
        switch self {
        case 0:
            return "a"
        case 1:
            return "two"
        case 2:
            return "three"
        case 3:
            return "four"
        case 4:
            return "five"
        default:
            return "a"
        }
    }
    
    var indePathRow:IndexPath {
        return IndexPath(row: self, section: 0)
    }
    
    var indePathSection:IndexPath {
        return IndexPath(row: 0, section: self)
    }
    
    var notZero:Int {
        return self == 0 ? 1 : self
    }
}
extension Double {
    
    func toInt() -> Int {
        return Int(self)
    }
}
