import UIKit

let pattern = "\\b([a-z])\\.([a-z]{2,})@([a-z]+)\\.ac\\.uk\\b"
let strRegex = "x.wu@strath.ac.uk, ak123@hotmail.com     e1s59@oxford.ac.uk, ee123@cooleng.co.uk, a.khan@surrey.ac.uk"
let regex = try! NSRegularExpression(pattern: pattern, options: [])
let matches = regex.matches(in: strRegex, options: [], range: NSRange(location: 0, length: strRegex.characters.count))

var result = [String]()
for match in matches {
    for n in 0..<match.numberOfRanges {
        let range = match.rangeAt(n)
        let r = strRegex.index(strRegex.startIndex, offsetBy: range.location) ..< strRegex.index(strRegex.startIndex, offsetBy: range.location+range.length)
        
        if (n % (regex.numberOfCaptureGroups + 1) != 0) {
            result.append(strRegex.substring(with: r))
            strRegex.substring(with: r)
        }
    }
}

print(result)
//let replacedStr = regex.stringByReplacingMatches(in: strRegex, options: [], range: NSRange(location: 0, length: strRegex.characters.count), withTemplate: "($1, $2, $3)")
