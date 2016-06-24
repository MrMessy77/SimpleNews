//
//  MMBaseTransitionsController.swift
//  ServerDaysNews
//
//  Created by MrMessy on 16/4/13.
//  Copyright © 2016年 MrMessy. All rights reserved.
//

import UIKit

class MMBaseTransitionsController: UIViewController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - UINavigationControllerDelegate
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if animationController.isKindOfClass(MMBaseAnimator) {
            return (animationController as! MMBaseAnimator).interactiveTransitioning
        }
        return nil
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .Push {
//            if toVC.hideBaseTabbarWhenPushed == true {
//                let tabbarVC = tabBarController as! BaseTabbarController
//                tabbarVC.customTabbar.hidden = true
//                let customTabbar = UIView(frame: tabbarVC.customTabbar.frame)
//                customTabbar.backgroundColor = UIColor.redColor()
//                fromVC.view.addSubview(customTabbar)
//                UIView.animateWithDuration(0.35, animations: { 
//                    
//                    }, completion: { (finished) in
//                })
//            }
            let pushAnimator = MMPushAnimator()
            return pushAnimator
        }else if operation == .Pop {
//            if fromVC.hideBaseTabbarWhenPushed == true {
//                let tabbarVC = tabBarController as! BaseTabbarController
//                let customTabbar = UIView(frame: tabbarVC.customTabbar.frame)
//                customTabbar.backgroundColor = UIColor.redColor()
//                toVC.view.addSubview(customTabbar)
//                UIView.animateWithDuration(0.35, animations: {
//                    
//                    }, completion: { (finished) in
//                        tabbarVC.customTabbar.hidden = false
//                })
//            }
            let popAnimator = MMPopAnimator()
            return popAnimator
        }
        return nil
    }
    //
}
