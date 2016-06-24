//
//  Extensions+UIView.swift
//  ServerDaysNews
//
//  Created by MrMessy on 16/2/21.
//  Copyright © 2016年 MrMessy. All rights reserved.
//

import UIKit

extension UIView {
    func scaleMyView() {
        let newTransform: CGAffineTransform = CGAffineTransformScale(self.transform, 0.1, 0.1)
        self.transform = newTransform
        self.alpha = 0
    }
    
    func scaleBigAnimation() {
        self.scaleBigWithTime(0.35) { () -> Void in
            self.transform = CGAffineTransformIdentity
        }
    }
    
    func scaleBigWithTime(time: NSTimeInterval, handle: ()->Void) {
        UIView.animateWithDuration(time, animations: { () -> Void in
            let newTransform: CGAffineTransform = CGAffineTransformConcat(self.transform, CGAffineTransformInvert(self.transform))
            self.transform = newTransform
            self.alpha = 1
            }) { (f:Bool) -> Void in
                handle()
        }
    }
    
    //MARK: - 简化frame
    var mm_width: CGFloat {
        get {
            return self.frame.size.width
        }
    }
    
    var mm_height: CGFloat {
        get {
            return self.frame.size.height
        }
    }
    
    var mm_x: CGFloat {
        get {
            return self.frame.origin.x
        }
    }
    
    var mm_y: CGFloat {
        get {
            return self.frame.origin.y
        }
    }
}
