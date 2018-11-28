//
//  LoginController.swift
//  CustomTabbarController
//
//  Created by user on 27/11/18.
//  Copyright © 2018 SM. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        navigationItem.title = "Login Controller"
        setupLoginBarButton()
    }
    
    func setupLoginBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Login", style: .plain, target: self, action: #selector(handleLogin))
    }
    
    @objc func handleLogin() {
        let ud = UserDefaults.standard
        ud.set(true, forKey: ProfileController.isLoggedIn)
        
        guard let  mainTabbarController = UIApplication.shared.keyWindow?.rootViewController as? MainTabbarController else { return }
        mainTabbarController.setupViewControllers()
        
        dismiss(animated: true, completion: nil)
        
    }
    
}
