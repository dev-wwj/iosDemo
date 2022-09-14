//
//  TestViewController.swift
//  HybridLanguage
//
//  Created by wangwenjian on 2022/4/19.
//

import Foundation

class TestModel: NSObject {
    var block2: (() -> Void)?
    
    func blockAction(){
        block2?()
    }
}


class TestViewController: UIViewController {
    
   @objc var block1: (() -> Void)?
    
    let testModel = TestModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .blue
        testModel.block2 = block1
        
        testModel.blockAction()
    }
    
}
