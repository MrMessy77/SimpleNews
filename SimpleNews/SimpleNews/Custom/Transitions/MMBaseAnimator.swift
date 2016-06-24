//
//  MMBaseAnimator.swift
//  ServerDaysNews
//
//  Created by MrMessy on 16/3/5.
//  Copyright © 2016年 MrMessy. All rights reserved.
//

import UIKit

class MMBaseAnimator: NSObject {
    
    var duration: NSTimeInterval!
    var interactiveTransitioning: UIViewControllerInteractiveTransitioning!
    
    override init() {
        super.init()
        duration = 0.35
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
}
