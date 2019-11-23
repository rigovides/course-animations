//
//  ViewController.swift
//  animations
//
//  Created by Vides, Rigoberto on 10/03/19.
//  Copyright © 2019 Vides, Rigoberto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var square: UIView? = nil
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //animations to test here
        self.viewWithAutoReverse()
    }
    
    func addSquare() {
        let square = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 80, height: 80)))
        square.center = self.view.center
        square.backgroundColor = .red
        self.square = square
        self.view.addSubview(square)
    }
}


// Property Animator
extension ViewController {
    //Changing single proprety
    func animateSingleProperty() {
        self.addSquare()
        
        let animation = UIViewPropertyAnimator(duration: 2.33, curve: .linear) {
            self.square?.backgroundColor = .green
        }
        
        animation.startAnimation()
    }
    
    func animateMultipleProperties() {
        self.addSquare()
        
        let animation = UIViewPropertyAnimator(duration: 2.33, curve: .linear) {
            self.square?.center.y += 250
            self.square?.backgroundColor = .green
        }
        
        animation.startAnimation()
    }
    
    func animateWithCompletion() {
        self.addSquare()
        
        let animation = UIViewPropertyAnimator(duration: 2.33, curve: .linear) {
            self.square?.backgroundColor = .green
        }
        
        animation.addCompletion { _ in
            print("finished")
        }
        
        animation.startAnimation()
    }
    
    func removingOnCompletion() {
        self.addSquare()
        
        let animation = UIViewPropertyAnimator(duration: 2.33, curve: .linear) {
            self.square?.alpha = 0
        }
        
        animation.addCompletion { _ in
            self.square?.removeFromSuperview()
        }
        
        animation.startAnimation()
    }
    
    func updateWithoutAnimations() {
        self.addSquare()
        
        let animation = UIViewPropertyAnimator(duration: 2.33, curve: .linear) {
            self.square?.backgroundColor = .blue
            UIView.performWithoutAnimation {
                self.square?.center.x += 120
            }
        }
        
        animation.startAnimation()
    }
}

// View Animations
// UIView.animate(withDuration:delay:options:animations:completion:)
extension ViewController {
    func basicViewAnimation() {
        self.addSquare()
        UIView.animate(withDuration: 2.33) {
            self.square?.backgroundColor = .green
        }
    }
    
    func viewAnimationWithCompletion() {
        self.addSquare()
        UIView.animate(withDuration: 2.33, animations: {
            self.square?.backgroundColor = .purple
        }) { _ in
            self.square?.removeFromSuperview()
        }
    }
    
    func viewAnimationWithTimingCurve() {
        self.addSquare()
        let options: UIView.AnimationOptions = .curveEaseIn
        UIView.animate(withDuration: 5.33, delay: 0, options: options, animations: {
            self.square?.center.y += 280
        }, completion: nil)
    }
    
    func viewWithRepeatOption() {
        self.addSquare()
        guard let square = self.square else {
            return
        }
        
        let options: UIView.AnimationOptions = [.repeat, .curveLinear]
        UIView.animate(withDuration: 0.33, delay: 0, options: options, animations: {
            self.square?.transform = square.transform.rotated(by: CGFloat(Double.pi / 2))
        }, completion: nil)
    }
    
    func viewWithAutoReverse() {
        self.addSquare()
        self.square?.center.y -= 280
        let options: UIView.AnimationOptions = [.curveEaseIn, .autoreverse, .repeat]
        UIView.animate(withDuration: 0.44, delay: 0, options: options, animations: {
            self.square?.center.y += 560
        }, completion: nil)
    }
}

