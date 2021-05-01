//
//  AntTwoListener.swift
//  AnimationIOS
//
//  Created by Rustam Keneev on 5/1/21.
//

import UIKit
protocol AntTwoListenerDelegate {
    func startOneAnt()
}

class AntTwoListener: NSObject, CAAnimationDelegate {
    
    var delegate: AntTwoListenerDelegate? = nil
    
    init(delegate: AntTwoListenerDelegate) {
        self.delegate = delegate
    }
    
    func animationDidStart(_ anim: CAAnimation) {
        
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        delegate?.startOneAnt()
    }
}
