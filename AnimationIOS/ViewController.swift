//
//  ViewController.swift
//  AnimationIOS
//
//  Created by Rustam Keneev on 4/21/21.
//

import UIKit
import SnapKit
class ViewController: UIViewController,CAAnimationDelegate {
    
    lazy var ant1: UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "ants")?.rotate(radians: CGFloat.pi)
        return view
    }()
    
    lazy var ant2: UIImageView = {
       let view = UIImageView()
        let image = UIImage(named: "ants")
        view.image = image

        return view
    }()
    
    lazy var animationOne: CABasicAnimation = {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = [200,568 / 2]
        animation.delegate = self
        animation.toValue = [100,568 / 2]
        animation.duration = 3.0
        animation.delegate = self
        animation.autoreverses = true
        return animation
    }()
    
    lazy var animationTwo: CABasicAnimation = {
        let animation = CABasicAnimation(keyPath: "position")
        animation.toValue = [200,568 / 2]
        animation.fromValue = [100,568 / 2]
        animation.duration = 3.0
        animation.autoreverses = true
        return animation
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(ant1)
        ant1.snp.makeConstraints{(make) in
            make.height.width.equalTo(100)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-20)

        }
        
        view.addSubview(ant2)
        ant2.snp.makeConstraints{(make) in
            make.height.width.equalTo(100)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
        }
        
        ant1.layer.add(animationOne,forKey:"animationPosition")
        ant2.layer.add(animationOne,forKey:"animationPosition")

    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        ant2.layer.add(animationTwo,forKey:"animationPosition")
        ant1.layer.add(animationOne,forKey:"animationPosition")

    }
}

extension UIImage {
    func rotate(radians: CGFloat) -> UIImage {
        let rotatedSize = CGRect(origin: .zero, size: size)
            .applying(CGAffineTransform(rotationAngle: CGFloat(radians)))
            .integral.size
        UIGraphicsBeginImageContext(rotatedSize)
        if let context = UIGraphicsGetCurrentContext() {
            let origin = CGPoint(x: rotatedSize.width / 2.0,
                                 y: rotatedSize.height / 2.0)
            context.translateBy(x: origin.x, y: origin.y)
            context.rotate(by: radians)
            draw(in: CGRect(x: -origin.y, y: -origin.x,
                            width: size.width, height: size.height))
            let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            return rotatedImage ?? self
        }

        return self
    }
}
