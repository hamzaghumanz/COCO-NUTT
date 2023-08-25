//
//  String+.swift
//  Journey30
//
//  Created by Macbook 5 on 2/3/23.
//

import Foundation
import UIKit

extension String: Error {
        
    func toUrl() -> URL {
        return URL(string: self)!
    }
    
    func toHijriDate() -> Date? {
        let formmatter = DateFormatter()
        formmatter.dateFormat = "dd MMMM yyyy"
        formmatter.calendar = Calendar(identifier: .islamicUmmAlQura)
        return formmatter.date(from: self)
    }
    
    func toDate() -> Date? {
        let formmatter = DateFormatter()
        formmatter.dateFormat = "dd-MMMM-yyyy"
        formmatter.calendar = Calendar(identifier: .gregorian)
        return formmatter.date(from: self)
    }
    
    func width(withHeight height: CGFloat, font: UIFont) -> CGFloat {
        let maxSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: height)
        let actualSize = self.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], attributes: [.font : font], context: nil)
        return actualSize.width
    }
    
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.height
    }
    
    func boolValue() -> Bool {
        return UserDefaults.standard.bool(forKey: self)
    }
    
    func doubleValue() -> Double {
        return UserDefaults.standard.double(forKey: self)
    }
    
    func colorName() -> String {
        return UserDefaults.standard.string(forKey: self) ?? ""
    }
    
    func saveBool() {
        UserDefaults.standard.bool(forKey: self)
    }
    
    func addFire() -> String {
        var s = self
        s.append(" \u{1F525}")
        return s
    }
    
    func idToBounds() -> CGRect {
        switch self {
        case "StarterAccess":
            return CGRect(x: 0, y: 0, width: 75.333, height: 31)
        case "StandardAccess":
            return CGRect(x: 0, y: 0, width: 104.0, height: 31)
        default:
            return CGRect(x: 0, y: 0, width: 114.0, height: 31)
        }
    }
    
    func idTotTitle() -> String {
        switch self {
        case "StarterAccess":
            return "Starter"
        case "StandardAccess":
            return "Standard"
        default:
            return "Advanced"
        }
    }
    
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
    func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }
    
    func spacer() -> String {
        var i = self
        i.append(" ")
        return i
    }
    
    func colon() -> String {
        var i = self
        i.append(": ")
        return i
    }
    
    func dotNewLine() -> String {
        var i = self
        i.append(".\n")
        return i
    }
    
    func singlrPlural(num:Int) -> String {
        var i = self
        if  num > 1 {
            i.append("s")
        }
        return i
    }
    
    
    var numberOfWords:Int {
        let chararacterSet = CharacterSet.whitespacesAndNewlines.union(.punctuationCharacters)
        let components = self.components(separatedBy: chararacterSet)
        let words = components.filter { !$0.isEmpty }
        return words.count
    }
    
    func replaceExtraAgo() -> String {
        let ago1 = self.replacingOccurrences(of: "ago", with: "")
        let ago2 = ago1.replacingOccurrences(of: ".ago", with: "")
        let ago3 = ago2.replacingOccurrences(of: "Ago", with: "")
        return ago3
    }
    
    
}


extension String {
    enum TrimmingOptions {
        case all
        case leading
        case trailing
        case leadingAndTrailing
    }
    
    func trimming(spaces: TrimmingOptions, using characterSet: CharacterSet = .whitespacesAndNewlines) ->  String {
        switch spaces {
        case .all: return trimmingAllSpaces(using: characterSet)
        case .leading: return trimingLeadingSpaces(using: characterSet)
        case .trailing: return trimingTrailingSpaces(using: characterSet)
        case .leadingAndTrailing:  return trimmingLeadingAndTrailingSpaces(using: characterSet)
        }
    }
    
    private func trimingLeadingSpaces(using characterSet: CharacterSet) -> String {
        guard let index = firstIndex(where: { !CharacterSet(charactersIn: String($0)).isSubset(of: characterSet) }) else {
            return self
        }

        return String(self[index...])
    }
    
    private func trimingTrailingSpaces(using characterSet: CharacterSet) -> String {
        guard let index = lastIndex(where: { !CharacterSet(charactersIn: String($0)).isSubset(of: characterSet) }) else {
            return self
        }

        return String(self[...index])
    }
    
    private func trimmingLeadingAndTrailingSpaces(using characterSet: CharacterSet) -> String {
        return trimmingCharacters(in: characterSet)
    }
    
    private func trimmingAllSpaces(using characterSet: CharacterSet) -> String {
        return components(separatedBy: characterSet).joined()
    }
    func replacingRegex(
            matching pattern: String,
            findingOptions: NSRegularExpression.Options = .caseInsensitive,
            replacingOptions: NSRegularExpression.MatchingOptions = [],
            with template: String
        ) throws -> String {

            let regex = try NSRegularExpression(pattern: pattern, options: findingOptions)
            let range = NSRange(startIndex..., in: self)
            return regex.stringByReplacingMatches(in: self, options: replacingOptions, range: range, withTemplate: template)
    }
}
extension Optional where Wrapped == String {
    func isEmptyOrWhitespace() -> Bool {
        // Check nil
        guard let this = self else { return true }
        
        // Check empty string
        if this.isEmpty {
            return true
        }
        // Trim and check empty string
        return (this.trimmingCharacters(in: .whitespaces) == "")
    }
}
