//
//  ViewController.swift
//  AnimationIOS
//
//  Created by Rustam Keneev on 4/21/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController, AntOneListenerDelegate, AntTwoListenerDelegate {
   
    func startTwoAnt() {
        hpTowAnt = hpTowAnt - Int.random(in: 0..<20)
        
        antTitleTwo.text = String(hpTowAnt)
        
        if (hpTowAnt <= 0) {
            repeatButton.isHidden = false
            winTitle.text = "One Ant Win"
        } else {
            startAnimationHitAntTwo()
        }
    }
    
    func startOneAnt() {
        hpOneAnt = hpOneAnt - Int.random(in: 0..<20)
        
        antTitleOne.text = String(hpOneAnt)
        
        if (hpOneAnt <= 0) {
            repeatButton.isHidden = false
            winTitle.text = "Two Ant Win"
        } else {
            startAnimationHitAntOne()
        }
    }
    
    var hpOneAnt = 100
    var hpTowAnt = 100

    var antOne: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .blue
        return view
    }()
    
    var repeatButton: UIButton = {
        let view = UIButton()
        view.setTitle("repeat", for: .normal)
        view.backgroundColor = .black
        view.isHidden = true
        view.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        view.setTitleColor(.white, for: .normal)
        return view
    }()
    
    lazy var antOneListener: AntOneListener = {
        return AntOneListener(delegate: self)
    }()
    
    lazy var antTwoListener: AntTwoListener = {
        return AntTwoListener(delegate: self)
    }()
    
    var antTitleOne: UILabel = {
        let view = UILabel()
        view.text = "100"
        return view
    }()
    
    var antTwo: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .red
        return view
    }()
    
    var antTitleTwo: UILabel = {
        let view = UILabel()
        view.text = "100"
        return view
    }()
    
    var winTitle: UILabel = {
        return UILabel()
    }()
    
    @objc func clickButton(view: UIButton) {
        repeatButton.isHidden = true
        antTitleOne.text = "100"
        antTitleTwo.text = "100"
        hpOneAnt = 100
        hpTowAnt = 100
        
        winTitle.text = String()
        
        startRandomGame()
    }
    
    func startRandomGame() {
        var s = Int.random(in: 0..<1)
        
        if s == 0 {
            startAnimationHitAntOne()
        } else if s == 1 {
            startAnimationHitAntTwo()
        }
    }
    
    override func viewDidLoad() {
        view.addSubview(antOne)
        antOne.snp.makeConstraints { (make) in
            make.height.width.equalTo(100)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
        }
        
        view.addSubview(antTitleOne)
        antTitleOne.snp.makeConstraints { (make) in
            make.centerX.equalTo(antOne)
            make.bottom.equalTo(antOne.snp.top).offset(-10)
        }
               
        view.addSubview(repeatButton)
        repeatButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(50)
        }
        
        view.addSubview(antTwo)
        antTwo.snp.makeConstraints { (make) in
            make.height.width.equalTo(100)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-20)
        }
        
        view.addSubview(antTitleTwo)
        antTitleTwo.snp.makeConstraints { (make) in
            make.centerX.equalTo(antTwo)
            make.bottom.equalTo(antOne.snp.top).offset(-10)
        }

        view.addSubview(winTitle)
        winTitle.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-100)
            make.centerX.equalToSuperview()
        }
        
        print("\(view.frame.width) \(view.frame.height)")
        
        startRandomGame()
    }

    func startAnimationHitAntOne() {
        let theAnimation = CABasicAnimation(keyPath: "position")

theAnimation.fromValue = [120.0, 568.0 / 2]
        theAnimation.toValue = [320.0 - 120.0, 568.0 / 2]
        theAnimation.duration = 0.3
        theAnimation.delegate = antOneListener
        theAnimation.autoreverses = true

        antOne.layer.add(theAnimation, forKey: "animatePosition")
    }
    
    func startAnimationHitAntTwo() {
        let theAnimation = CABasicAnimation(keyPath: "position")

        theAnimation.fromValue = [320.0 - 120.0, 568.0 / 2]
        theAnimation.toValue = [120.0, 568.0 / 2]
        theAnimation.duration = 0.3
        theAnimation.delegate = antTwoListener
        theAnimation.autoreverses = true

        antTwo.layer.add(theAnimation, forKey: "animatePosition")
    }
}
