//
//  ViewController.swift
//  GuideView
//
//  Created by wangwenjian on 2022/5/9.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        _ = content
//        _ = baseView
//
//        let guider = GuiderView.init(in: content)
//        guider.show(for: baseView, edge: UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10) , cornerRadius: 50)
//
//        guider.addImage("arrow", offset: CGPoint(x: 50, y: 100))
//        guider.addSubview(UIImageView(image: UIImage(named: "arrow")), offset: CGPoint(x: 50, y: 150))
        
        
//        mask.backgroundColor = .red
//        view.addSubview(mask)
//        mask.frame = CGRect(x: 80, y: 80, width: 100, height: 100)
//
    
        // Mask
        let mask = UIImageView(image: UIImage(named: "bd_anim_finger"))
//        let contentView = UIView()
//        contentView.frame = CGRect(x: 80, y: 200, width: 200, height: 200)
//        contentView.backgroundColor = .red
//        self.view.addSubview(contentView)
//        mask.layer.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
//        contentView.layer.mask = mask.layer
        
        
        // Mask 反选
        let backgroundView = UIView(frame: view.bounds)
        backgroundView.backgroundColor =  UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.6)
        view.addSubview(backgroundView)

        let maskLayer = CAShapeLayer()
        maskLayer.fillRule = .nonZero //  奇偶层显示规则
           
        let basicPath = UIBezierPath(rect: view.frame) // 底层

        let maskPath = UIBezierPath(ovalIn: CGRect(x: 100, y: 100, width: 35, height: 35))
        basicPath.append(maskPath) // 重叠
        
        maskLayer.path = basicPath.cgPath
        backgroundView.layer.mask = maskLayer
        
    }
    
    lazy var content: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(80)-[view(==width)]", options: .directionLeadingToTrailing, metrics: ["width":200], views: ["view" : view]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(80)-[view(==Height)]", options: .directionLeadingToTrailing, metrics: ["Height":300], views: ["view" : view]))
        return view
    }()
    
    lazy var baseView: UIButton = {
        let view = UIButton()
        view.layer.cornerRadius = 50
        view.backgroundColor = .blue
        view.addTarget(self, action: #selector(touch), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        content.addSubview(view)
        content.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(30)-[view(==width)]", options: .directionLeadingToTrailing, metrics: ["width":100], views: ["view" : view]))
        content.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(30)-[view(==Height)]", options: .directionLeadingToTrailing, metrics: ["Height":100], views: ["view" : view]))
        return view
    }()
    
    deinit {
        NSLog("deInit")
    }
    
    @objc func touch() {
        let vc = ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}


extension UIImage {

    func invertMask(_ frame: CGRect, maskSize: CGSize) -> CAShapeLayer {
        let maskLayer = CAShapeLayer()
        maskLayer.frame = CGRect(x: 0, y: 0, width: maskSize.width, height: maskSize.height)
        maskLayer.fillRule = .evenOdd
        
        let iv = UIImageView(image: self)
        iv.layer.frame = frame
        
        maskLayer.mask = iv.layer
        
        return maskLayer
    }

    
}
