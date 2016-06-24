//
//  MMPushAnimator.swift
//  ServerDaysNews
//
//  Created by MrMessy on 16/3/22.
//  Copyright © 2016年 MrMessy. All rights reserved.
//

import UIKit

class MMPushAnimator: MMBaseAnimator, UIViewControllerAnimatedTransitioning {
    
    var blackMask: UIView!
    var customTabbar = UIView()
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        // 目标控制器
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        // 源控制器
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        // 控制器栈
        let container = transitionContext.containerView()
        //入栈
        container?.addSubview(toVC!.view)
        toVC!.view.frame.origin.x = screenWidth
        
        blackMask = UIView(frame: CGRectMake(0, 0, screenWidth, screenHeight))
        blackMask.backgroundColor = Color_Black
        blackMask.alpha = 0
        container?.insertSubview(blackMask, aboveSubview: fromVC!.view)

        if toVC!.hideBaseTabbarWhenPushed == true {
            let tabbarVC = fromVC!.tabBarController as! BaseTabbarController
            self.customTabbar = tabbarVC.customTabbar
            fromVC!.view.addSubview(self.customTabbar)
        }
        
        UIView.animateKeyframesWithDuration(duration, delay: 0, options: UIViewKeyframeAnimationOptions.CalculationModeLinear, animations: { () -> Void in
            let scale: CGFloat = 0.95
            fromVC!.view.transform = CGAffineTransformMakeScale(scale, scale)
            toVC!.view.frame.origin.x = 0
            self.blackMask.alpha = 0.4
            }) { (finished) -> Void in
                fromVC!.view.transform = CGAffineTransformIdentity
                self.blackMask.removeFromSuperview()
                container?.addSubview(fromVC!.view)
                container?.addSubview(toVC!.view)
                if transitionContext.transitionWasCancelled() == true {
                    toVC!.view.removeFromSuperview()
                }
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }
}
