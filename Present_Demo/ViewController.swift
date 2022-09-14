//
//  ViewController.swift
//  Present_Demo
//
//  Created by wangwenjian on 2022/5/18.
//

import UIKit

class ViewController: UIViewController {

    
    let yellowVC = UIViewController()
    let blueVC = UIViewController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .red
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.yellowVC.view.backgroundColor = .yellow
            self.present(self.yellowVC, animated: true) {
                
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
                let vc = self.yellowVC.presentedViewController
                vc?.dismiss(animated: true, completion: {
                    self.yellowVC.dismiss(animated: true) {
        
                    }
                })

            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.blueVC.view.backgroundColor = .blue
            self.yellowVC.present(self.blueVC, animated: true) {
                
            }
        }
    }


}

