//
//  ProfileController.swift
//  CustomTabbarController
//
//  Created by user on 27/11/18.
//  Copyright © 2018 SM. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
    
    static let isLoggedIn = "isLoggedIn"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.cyan
        navigationItem.title = "Profile Controller"
        
        setupRightBarButton()
    }
    
    func setupRightBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "gear")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleLogout))
    }
    
    @objc func handleLogout() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Log out", style: .destructive, handler: { (_) in
            
            self.startLogout()
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    func startLogout() {
        
        let ud = UserDefaults.standard
        ud.set(false, forKey: ProfileController.isLoggedIn)
        
        
        let loginController = LoginController()
        let loginNavController = UINavigationController(rootViewController: loginController)
        present(loginNavController, animated: true, completion: nil)
    }
    
    
}
