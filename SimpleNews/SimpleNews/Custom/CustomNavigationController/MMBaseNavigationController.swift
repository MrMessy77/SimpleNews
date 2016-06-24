//
//  MMBaseNavigationController.swift
//  ServerDaysNews
//
//  Created by MrMessy on 16/4/8.
//  Copyright © 2016年 MrMessy. All rights reserved.
//

import UIKit

class MMBaseNavigationController: UINavigationController, UINavigationControllerDelegate {

    var screenShotList = [UIImage]()
    /** 正在拖动 */
    var isMoving = false
    /** 开始触摸的点 */
    var startTouchPoint: CGPoint = CGPointMake(0.0, 0.0)
    /** 背景容器 */
    var bgContainer: UIView!
    /** push之前的屏幕快照imageView */
    var lastScreenShotView: UIImageView!
    /** 黑色遮罩 */
    var blackMask: UIView!
    var customTabbar = XZMTabbarExtension()
    var didPop = false
    var recentController = UIViewController()
    
    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        screenShotList.append(self.capture())
        
        if self.viewControllers.count > 0 {
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
            panGesture.maximumNumberOfTouches = 1
            view.addGestureRecognizer(panGesture)
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    override func popViewControllerAnimated(animated: Bool) -> UIViewController? {
        screenShotList.removeLast()
        return super.popViewControllerAnimated(animated)
    }
    //
    
    //MARK: - Private
    func panGesture(panGesture: UIPanGestureRecognizer) {
        if (viewControllers.count <= 1) {return}
        let fromVC = viewControllers[viewControllers.count - 1]
        let toVC = viewControllers[viewControllers.count - 2]
        
        let touchPoint = panGesture.locationInView(UIApplication.sharedApplication().keyWindow)
        switch panGesture.state {
        case .Began:
            //记录初始位置
            isMoving = true
            startTouchPoint = touchPoint
            
            //创建背景View
            let bgContainer = UIView(frame: CGRectMake(0, 0, view.mm_width, view.mm_height))
            self.bgContainer = bgContainer
            view.superview?.insertSubview(bgContainer, belowSubview: self.view)
            self.bgContainer.hidden = false
            
            //黑色遮罩
            let blackMask = UIView(frame: CGRectMake(0, 0, view.mm_width, view.mm_height))
            self.blackMask = blackMask
            blackMask.backgroundColor = MMBlackColor
            self.bgContainer.addSubview(blackMask)
            
            //释放之前的屏幕快照View
            if self.lastScreenShotView != nil { self.lastScreenShotView.removeFromSuperview() }

            //屏幕快照
            let lastScreenShot = self.screenShotList.last
            let lastScreenShotView = UIImageView(image: lastScreenShot!)
            self.lastScreenShotView = lastScreenShotView
            if didPop == false {
                if fromVC.hideBaseTabbarWhenPushed == true {
                    didPop = true
                    let tabbarVC = toVC.tabBarController as! BaseTabbarController
                    self.customTabbar = tabbarVC.customTabbar
                    self.lastScreenShotView.addSubview(self.customTabbar)
                }
            }
            self.bgContainer.insertSubview(self.lastScreenShotView, belowSubview: self.blackMask)
        case .Ended:
            if touchPoint.x - startTouchPoint.x > 100 {
                UIView.animateWithDuration(0.3, animations: { 
                    self.moveViewWithX(screenWidth)
                    }, completion: { (finished) in
                        self.didPop = false
                        if fromVC.hideBaseTabbarWhenPushed == true {
                            let tabbarVC = toVC.tabBarController as! BaseTabbarController
                            tabbarVC.view.addSubview(self.customTabbar)
                        }
                        self.popViewControllerAnimated(false)
                        self.view.frame.origin.x = 0
                        self.isMoving = false
                        //拖动完毕后记得释放背景View
                        if self.bgContainer != nil { self.bgContainer.removeFromSuperview() }
                })
            }else {
                UIView.animateWithDuration(0.3, animations: { 
                    self.moveViewWithX(0)
                    }, completion: { (finished) in
                        self.didPop = false
                        self.isMoving = false
                        self.bgContainer.hidden = true
                        //拖动完毕后记得释放背景View
                        if self.bgContainer != nil { self.bgContainer.removeFromSuperview() }
                })
            }
            return
        case .Cancelled:
            UIView.animateWithDuration(0.3, animations: { 
                self.moveViewWithX(0)
                }, completion: { (finished) in
                    self.isMoving = false
                    self.bgContainer.hidden = true
            })
            return
        default:
            break
        }
        if isMoving {
            self.moveViewWithX(touchPoint.x - startTouchPoint.x)
        }
    }
    
    func moveViewWithX(x: CGFloat) {
        var x1: CGFloat = 0.0
        x1 = x > screenWidth ? screenWidth : x
        x1 = x < 0 ? 0 : x
        
        view.frame.origin.x = x1
        
        let scale = (x1 / (screenWidth * 20)) + 0.95 //0.05 - 375
        let alpha = 0.4 - (x1 / (screenWidth * 2.5))
        
        self.lastScreenShotView.transform = CGAffineTransformMakeScale(scale, scale)
        self.blackMask.alpha = alpha
    }
    
    func capture() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(view.frame.size, view.opaque, 0.0)
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image
    }
    //
    
    //MARK: - UINavigationControllerDelegate
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        let selector = recentController.respondsToSelector(#selector(UINavigationControllerDelegate.navigationController(_:interactionControllerForAnimationController:)))
        if selector {
            return (recentController as! UINavigationControllerDelegate).navigationController!(navigationController, interactionControllerForAnimationController: animationController)
        }
        return nil
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let selector = #selector(UINavigationControllerDelegate.navigationController(_:animationControllerForOperation:fromViewController:toViewController:))
        var result: UIViewControllerAnimatedTransitioning? = nil
        if fromVC.respondsToSelector(selector) {
            result = (fromVC as! UINavigationControllerDelegate).navigationController!(navigationController, animationControllerForOperation: operation, fromViewController: fromVC, toViewController: toVC)
            if (result != nil) {
                recentController = fromVC
            }
        }else if toVC.respondsToSelector(selector) {
            result = (toVC as! UINavigationControllerDelegate).navigationController!(navigationController, animationControllerForOperation: operation, fromViewController: fromVC, toViewController: toVC)
            if (result != nil) {
                recentController = toVC
            }
        }
        return result
    }
    //
}
