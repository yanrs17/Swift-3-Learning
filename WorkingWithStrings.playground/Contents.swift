//: Playground - noun: a place where people can play

import UIKit

var str = "Hello"

var newString = str + " Ryan!"

for c in newString.characters {
    print(c)
}

let newTypeString = NSString(string: newString)

newTypeString.substring(to: 5) // 0-4

newTypeString.substring(from: 4) // 4-end

var result = NSString(string: newTypeString.substring(from: 6))
// substring returns type String, so casting is required

var newResult = result.substring(to: 4) // len is also 4

newTypeString.substring(with: NSRange(location: 6, length: 4))

if newTypeString.contains("Ryan") {
    print("contains")
} else {
    print("does not contain")
}

newTypeString.components(separatedBy: " ")

newTypeString.uppercased

newTypeString.lowercased

func extractString(whole: String, before: String, after: String) -> String {
    // If there are multiple strings with value "before", select the first one.

    if whole == "" { return "" }
    var firstSplit = whole.components(separatedBy: before)
    if firstSplit.count != 1 { firstSplit.remove(at: 0) }
    let firstJoint = firstSplit.joined(separator: before)
    var secondSplit = firstJoint.components(separatedBy: after)
    return secondSplit[0]
}

extractString(whole: "hadfjasdlzzfjhe", before: "qq", after: "zz")


