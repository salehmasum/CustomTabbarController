//
//  SomeController.swift
//  CustomTabbarController
//
//  Created by user on 28/11/18.
//  Copyright © 2018 SM. All rights reserved.
//

import UIKit

class SomeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        navigationItem.title = "Some Controller"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
    }
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
}
