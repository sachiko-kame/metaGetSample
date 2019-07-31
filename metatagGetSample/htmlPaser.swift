//
//  htmlPaser.swift
//  metatagGetSample
//
//  Created by 水野祥子 on 2019/07/06.
//  Copyright © 2019 sachiko. All rights reserved.
//

import UIKit

enum patternType{
    case meta
    
    var patternText:String{
        switch self {
        case .meta:
            return "<meta\\sproperty=(?:\"|\')(og|article):([a-zA_Z:]+?)(?:\"|\')\\scontent=\"(.*?)\""
        }
    }
}

class htmlPaser: NSObject {
    
    static func parse(htmlString: String, patternText:String) -> [NSTextCheckingResult]{
        let metatagRegex  = try! NSRegularExpression(
            pattern: patternText,
            options: [.dotMatchesLineSeparators]
        )
        let metaTagMatches = metatagRegex.matches(in: htmlString,
                                                  options: [],
                                                  range: NSMakeRange(0, htmlString.count))
        if metaTagMatches.isEmpty {
            return []
        }else{
            return metaTagMatches
        }
    }
    
    static func parseMetasGet(htmlString: NSString, patternText:String, textCheckingResults:[NSTextCheckingResult]) -> [String:String]{
        var parseMetas:[String:String] = [:]
        textCheckingResults.forEach {
            let withRange:NSString = htmlString.substring(with: NSRange(location: $0.range.location, length: ($0.range.length))) as NSString
            let regularExpression:String = patternText
            let rd = try? NSRegularExpression(pattern: regularExpression, options: NSRegularExpression.Options())
            
            if let r = rd?.firstMatch(in: withRange as String, options: NSRegularExpression.MatchingOptions(), range: NSMakeRange(0, withRange.length)) {
                let property0:String = withRange.substring(with: r.range(at: 1))
                let property1:String = withRange.substring(with: r.range(at: 2))
                let content:String = withRange.substring(with: r.range(at: 3))
                
                let property = property0 + ":" + property1
                parseMetas[property] = content
            }else{
                print("値はありません")
            }
        }
        return parseMetas
    }
}
