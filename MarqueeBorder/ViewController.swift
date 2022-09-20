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
        let frame = CGRect(x: 100, y: 200, width: 200, height: 400)
        cornerView = UIView(frame: frame)
        cornerView?.layer.cornerRadius = 10
        cornerView?.backgroundColor = UIColor.systemYellow
        self.view.addSubview(cornerView!)
        
        let path = UIBezierPath.init(roundedRect: cornerView!.bounds, cornerRadius: 10)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = cornerView!.bounds
        shapeLayer.lineWidth = 5
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.path = path.cgPath
                    
        let d = sqrt(frame.width * frame.width + frame.height * frame.height)
        let gLayer = CAGradientLayer()
        gLayer.frame = CGRect(x: -(d - frame.width)/2, y: -(d - frame.height)/2, width: d, height: d)
        
        gLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor, UIColor.green.cgColor,UIColor.red.cgColor]
        gLayer.locations = [0.0, 0.33, 0.66, 1.0]
        gLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
        gLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        gLayer.type = .conic
        
        let pLayer = CALayer()
        pLayer.frame = cornerView!.bounds
        pLayer.mask = shapeLayer
        pLayer.addSublayer(gLayer)
        cornerView!.layer.addSublayer(pLayer)

        let animate = CABasicAnimation.init(keyPath: "transform.rotation.z")
        animate.toValue = Double.pi * 2
        animate.duration = 1
        animate.repeatCount = Float(INT_MAX)
        gLayer.add(animate, forKey: nil)
    }
    


}

