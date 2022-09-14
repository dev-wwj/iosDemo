//
//  ViewController.swift
//  MarqueeBorder
//
//  Created by wangwenjian on 2022/9/13.
//

import UIKit

class ViewController: UIViewController {

    var cornerView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        cornerView = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        cornerView?.layer.cornerRadius = 10
        cornerView?.backgroundColor = UIColor.clear
        self.view.addSubview(cornerView!)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = cornerView!.bounds
        shapeLayer.lineWidth = 5
        shapeLayer.repeatCount = 1
        shapeLayer.lineDashPhase = 1
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = UIColor.black.cgColor
        
        let path = UIBezierPath.init(roundedRect: cornerView!.bounds, cornerRadius: 10)
        shapeLayer.path = path.cgPath
        
        let pLayer = CALayer()
        pLayer.frame = cornerView!.bounds
        cornerView!.layer.addSublayer(pLayer)
        
        let d = sqrt(200 * 200 + 100 * 100)
        let r = d / 2
        
        let x = 100 - r
        let y = 50 - r
        let gLayer = CAGradientLayer()
        gLayer.frame = CGRect(x: x, y: y, width: d, height: d)
        gLayer.backgroundColor = UIColor.white.cgColor
        gLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor, UIColor.green.cgColor,UIColor.red.cgColor]
        gLayer.locations = [0.0, 0.3, 0.6, 0.9]
        gLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
        gLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        gLayer.type = .conic
        pLayer.addSublayer(gLayer)
        
        pLayer.mask = shapeLayer
        
        let animate = CABasicAnimation.init(keyPath: "transform.rotation.z")
        animate.toValue = Double.pi * 2
        animate.duration = 0.5
        animate.repeatCount = 9999
        gLayer.add(animate, forKey: nil)
    }
    


}

