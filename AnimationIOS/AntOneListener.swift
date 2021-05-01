//
//  AntOneListenerDelegate.swift
//  AnimationIOS
//
//  Created by Rustam Keneev on 5/1/21.
//

import UIKit

protocol AntOneListenerDelegate {
    func startTwoAnt()
}

class AntOneListener: NSObject, CAAnimationDelegate {
    
    var delegate: AntOneListenerDelegate? = nil
    
    init(delegate: AntOneListenerDelegate) {
        self.delegate = delegate
    }
    
    func animationDidStart(_ anim: CAAnimation) {
        
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        delegate?.startTwoAnt()
    }
}


