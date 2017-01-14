//
//  MMPopAnimator.swift
//  ServerDaysNews
//
//  Created by MrMessy on 16/3/5.
//  Copyright © 2016年 MrMessy. All rights reserved.
//

import UIKit

class MMPopAnimator: MMBaseAnimator, UIViewControllerAnimatedTransitioning {
    
    var blackMask: UIView!
//    var customTabbar = XZMTabbarExtension()
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        // 目标控制器
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        // 源控制器
        let formVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        // 控制器栈
        let container = transitionContext.containerView()
        container.insertSubview(toVC!.view, belowSubview: formVC!.view)
        blackMask = UIView(frame: CGRectMake(0, 0, screenWidth, screenHeight))
        blackMask.backgroundColor = UIColor.blackColor()
        container.insertSubview(blackMask, aboveSubview: toVC!.view)
        
        let scale: CGFloat = 0.95
        toVC?.view.transform = CGAffineTransformMakeScale(scale, scale)
        blackMask.alpha = 0.4
        formVC?.view.frame.origin.x = 0
        
//        if formVC!.hideBaseTabbarWhenPushed == true {
//            let tabbarVC = toVC!.tabBarController as! BaseTabBarViewController
////            self.customTabbar = tabbarVC.customTabbar
//            toVC!.view.addSubview(tabbarVC.view)
//        }
        
        UIView.animateKeyframesWithDuration(duration, delay: 0, options: UIViewKeyframeAnimationOptions.CalculationModeLinear, animations: { () -> Void in
            toVC?.view.transform = CGAffineTransformIdentity
            formVC?.view.frame.origin.x = screenWidth
            self.blackMask.alpha = 0
            }) { (finished) -> Void in
//                if formVC!.hideBaseTabbarWhenPushed == true {
//                    let tabbarVC = toVC!.tabBarController as! BaseTabBarViewController
//                    tabbarVC.view.addSubview(self.customTabbar)
//                }
                self.blackMask.removeFromSuperview()
                formVC?.view.removeFromSuperview()
                if transitionContext.transitionWasCancelled() == true { //如果遇到未知取消操作恢复栈结构
                    container.addSubview(formVC!.view)
                }
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }
}
