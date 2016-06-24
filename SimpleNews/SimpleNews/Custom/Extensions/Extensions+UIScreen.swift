//
//  Extensions+UIScreen.swift
//  ServerDaysNews
//
//  Created by MrMessy on 16/2/21.
//  Copyright © 2016年 MrMessy. All rights reserved.
//

import UIKit

extension UIScreen {
    class var mainScreenWidth: CGFloat {//主屏幕宽度
        return UIScreen.mainScreen().bounds.size.width
    }
    class var mainScreenHeight: CGFloat {//主屏幕高度
        return UIScreen.mainScreen().bounds.size.height
    }
    
    class var mainScreenBounds: CGRect {//主屏幕bounds
        return UIScreen.mainScreen().bounds
    }
    
    class var mainScreenScale: CGFloat {//主屏幕比例
        return UIScreen.mainScreen().scale
    }
}
