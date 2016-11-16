//
//  ViewController.swift
//  HamburgerDemo
//
//  Created by Kyler Blue on 11/1/16.
//  Copyright © 2016 Kyler Blue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backContainerView: UIView!
    
    @IBOutlet weak var frontContainerView: UIView!
    
    var greenView: UIView!
    var redView: UIView!
    
    var menuOriginalCenter: CGPoint!
    var menuRightOffset: CGFloat!
    var menuRight: CGPoint!
    
    
    
    var main = UIStoryboard(name: "Main", bundle: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuRightOffset = 272
        menuOriginalCenter = frontContainerView.center
        menuRight = CGPoint(x: frontContainerView.center.x + menuRightOffset,y: frontContainerView.center.y)
        
        let greenViewController = main.instantiateViewController(withIdentifier: "GreenViewController")
        let redViewController = main.instantiateViewController(withIdentifier: "RedViewController")
        greenViewController.view.frame = backContainerView.bounds
        backContainerView.addSubview(greenViewController.view)
        redViewController.view.frame = frontContainerView.bounds
        frontContainerView.addSubview(redViewController.view)

        
    }
    
    
    
    
    
    @IBAction func didPanTopView(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
        let location = sender.location(in: view)
        
        
        
        
        if sender.state == .began {
            print("began")
            
            
        }   else if sender.state == .changed {
            print("changed")
            frontContainerView.center = CGPoint(x: menuOriginalCenter.x + translation.x, y: menuOriginalCenter.y)
            
        }   else if sender.state == .ended {
            print("ended")
            if velocity.x > 0 {
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                               animations: { () -> Void in
                                self.frontContainerView.center = self.menuRight
                    }, completion: nil)
            }   else  {
                UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: {
                    let closedCenter = CGPoint(x: self.frontContainerView.bounds.size.width/2.0, y: self.frontContainerView.bounds.size.height/2.0)
                    self.frontContainerView.center = closedCenter
                    }, completion: nil)
            }
            
        }
        
        
    }

        
        
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

