//
//  SwitchingViewController.swift
//  MAPD714-F2018-Lesson5
//
//  Created by Harsh Keshwala on 2018-10-04.
//  Copyright © 2018 CentennialCollege. All rights reserved.
//

import UIKit

class SwitchingViewController: UIViewController {

    // private instance variables
    
    private var blueViewController: BlueViewController!
    private var yellowViewController: YellowViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blueViewController = storyboard?.instantiateViewController(withIdentifier: "Blue") as! BlueViewController
       
        blueViewController.view.frame = view.frame
        switchViewController(from: nil, to: blueViewController)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        if blueViewController != nil
            && blueViewController!.view.superview == nil{
            blueViewController = nil
        }
        if yellowViewController != nil
            && yellowViewController!.view.superview == nil{
            yellowViewController = nil
        }
        
    }
    
    
    @IBAction func switchViews(sender: UIBarButtonItem) {
        
        if yellowViewController?.view.superview == nil{
            if yellowViewController ==  nil{
                yellowViewController = storyboard?.instantiateViewController(withIdentifier: "Yellow") as! YellowViewController
            }
        }else if blueViewController?.view.superview == nil{
            if blueViewController ==  nil{
                blueViewController = storyboard?.instantiateViewController(withIdentifier: "Blue") as! BlueViewController
            }
        }
        
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0)
        UIView.setAnimationCurve(.easeIn)
        
        if blueViewController != nil
            && blueViewController!.view.superview != nil {
            yellowViewController.view.frame = view.frame
            switchViewController(from: blueViewController, to: yellowViewController)
        } else{
            blueViewController.view.frame = view.frame
            switchViewController(from: yellowViewController, to: blueViewController)
        }
        UIView.commitAnimations()
    }
    
    private func switchViewController(from fromVC: UIViewController?, to toVC: UIViewController?){
        
        if fromVC != nil{
            fromVC!.willMove(toParentViewController: nil)
            fromVC!.view.removeFromSuperview()
            fromVC!.removeFromParentViewController()
        }
        if toVC != nil{
            self.addChildViewController(toVC!)
            self.view.insertSubview(toVC!.view, at: 0)
            toVC!.didMove(toParentViewController: self)
        }
    }
}
