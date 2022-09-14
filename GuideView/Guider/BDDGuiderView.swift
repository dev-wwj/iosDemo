//
//  GuiderView.swift
//  GuideView
//
//  Created by wangwenjian on 2022/5/9.
//

import UIKit

class GuiderView: UIView {

    
    private let inView : UIView
    
    private var forView: UIView?
    
    private var forEdge: UIEdgeInsets = UIEdgeInsets.zero
        
    @objc init(in view: UIView) {
        self.inView = view
        super.init(frame: .zero)
        self.isUserInteractionEnabled = true
        self.backgroundColor = UIColor.init(white: 0.0, alpha: 0.8)
        inView.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            self.leftAnchor.constraint(equalTo: self.inView.leftAnchor),
            self.topAnchor.constraint(equalTo: self.inView.topAnchor),
            self.rightAnchor.constraint(equalTo: self.inView.rightAnchor),
            self.bottomAnchor.constraint(equalTo: self.inView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var inRect : CGRect?
    
    @objc func show(for view: UIView, edge: UIEdgeInsets = .zero, cornerRadius: CGFloat = 0) {
        inView.layoutIfNeeded()
        forView = view
        forEdge = edge
        inRect = inView.convert(view.frame, from: inView)
        let rect = inView.convert(view.frame, from: inView).inset(by: edge)
        let path = UIBezierPath(rect: self.bounds)
        path.append(UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).reversing())
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        self.layer.mask = shape
    }
    
    
    @objc func addImage(_ name: String, offset: CGPoint) {
        guard let image =  UIImage(named: name) else {
            return
        }
        addSubview(UIImageView(image: image), offset: offset)
    }
    
    lazy var guides : [UIView] = []
        
    @objc func addSubview(_ view: UIView, offset: CGPoint) {
        guides.append(view)
        var origin = CGPoint.zero
        if let forView = forView {
            origin = inView.convert(forView.frame, from: inView).origin
        }
        inView.insertSubview(view, aboveSubview: self)
        view.frame = CGRect(x: origin.x + offset.x, y: origin.y + offset.y, width: view.frame.size.width, height: view.frame.size.height)
    }
    
    @objc func dissmiss() {
        guides.forEach { view in
            view.removeFromSuperview()
        }
        self.removeFromSuperview()
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard let inRect = inRect else {
            return self
        }
        if inRect.contains(point) {
            return nil
        }else {
            return self
        }
    }
    
    
}

