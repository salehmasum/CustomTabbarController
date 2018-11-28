//
//  MainTabbarController.swift
//  CustomTabbarController
//
//  Created by user on 27/11/18.
//  Copyright © 2018 SM. All rights reserved.
//

import UIKit

class MainTabbarController: UITabBarController, UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let index = viewControllers?.index(of: viewController)
        if index == 2 {
            let someController = SomeController()
            let someNavController = UINavigationController(rootViewController: someController)
            self.present(someNavController, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        tabBar.tintColor = .black
        
        let ud = UserDefaults.standard
        if let isLoggedIn = ud.value(forKey: ProfileController.isLoggedIn) as? Bool, isLoggedIn == true  {
            setupViewControllers()
            
        }else {
            
            DispatchQueue.main.async {
                let loginController = LoginController()
                let loginNavController = UINavigationController(rootViewController: loginController)
                self.present(loginNavController, animated: true, completion: nil)
            }
            
            return
        }
        
    }
    
    
    func setupViewControllers() {
        let homeController = HomeController()
        let homeNavController = UINavigationController(rootViewController: homeController)
        homeNavController.tabBarItem.image = UIImage(named: "home_unselected")
        homeNavController.tabBarItem.selectedImage = UIImage(named: "home_selected")
        
        
        let searchController = SearchController()
        let searchNavController = UINavigationController(rootViewController: searchController)
        searchNavController.tabBarItem.image = UIImage(named: "search_unselected")
        searchNavController.tabBarItem.selectedImage = UIImage(named: "search_selected")

        let middleController = MiddleController()
        let middleNavController = UINavigationController(rootViewController: middleController)
        middleNavController.tabBarItem.image = UIImage(named: "plus_unselected")


        let likeController   = LikeController()
        let likeNavController = UINavigationController(rootViewController: likeController)
        likeNavController.tabBarItem.image = UIImage(named: "like_unselected")
        likeNavController.tabBarItem.selectedImage = UIImage(named: "like_selected")

        let profileController = ProfileController()
        let profileNavController = UINavigationController(rootViewController: profileController)
        profileNavController.tabBarItem.image = UIImage(named: "profile_unselected")
        profileNavController.tabBarItem.selectedImage = UIImage(named: "profile_selected")
        
        
        viewControllers = [homeNavController, searchNavController, middleNavController, likeNavController, profileNavController]
        
        modifyTabbarItemsInset(top: 4, bottom: 4, left: 0, right: 0)
    }
    
    func modifyTabbarItemsInset(top: CGFloat, bottom: CGFloat, left: CGFloat, right: CGFloat) {
        
        guard let items = tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsets(top: top, left: left, bottom: -bottom, right: right)
        }
        
    }
    
    
}
