//
//  Extensions+UIColor.swift
//  ServerDaysNews
//
//  Created by MrMessy on 16/2/21.
//  Copyright © 2016年 MrMessy. All rights reserved.
//

import UIKit

extension UIColor {
    class func colorWithHexCode(code : String) -> UIColor {
        let colorComponent = {(startIndex : Int ,length : Int) -> CGFloat in
            var subHex = code.substringWithRange(Range<String.Index>(start: code.startIndex.advancedBy(startIndex), end: code.startIndex.advancedBy(startIndex + length)))
            subHex = subHex.characters.count < 2 ? "\(subHex)\(subHex)" : subHex
            var component:UInt32 = 0
            NSScanner(string: subHex).scanHexInt(&component)
            return CGFloat(component) / 255.0}
        
        let argb = {() -> (CGFloat,CGFloat,CGFloat,CGFloat) in
            switch(code.characters.count) {
            case 3: //#RGB
                let red = colorComponent(0,1)
                let green = colorComponent(1,1)
                let blue = colorComponent(2,1)
                return (red,green,blue,1.0)
            case 4: //#ARGB
                let alpha = colorComponent(0,1)
                let red = colorComponent(1,1)
                let green = colorComponent(2,1)
                let blue = colorComponent(3,1)
                return (red,green,blue,alpha)
            case 6: //#RRGGBB
                let red = colorComponent(0,2)
                let green = colorComponent(2,2)
                let blue = colorComponent(4,2)
                return (red,green,blue,1.0)
            case 8: //#AARRGGBB
                let alpha = colorComponent(0,2)
                let red = colorComponent(2,2)
                let green = colorComponent(4,2)
                let blue = colorComponent(6,2)
                return (red,green,blue,alpha)
            default:
                return (1.0,1.0,1.0,1.0)
            }}
        
        let color = argb()
        return UIColor(red: color.0, green: color.1, blue: color.2, alpha: color.3)
    }
}
