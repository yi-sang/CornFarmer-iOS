//
//  MyPageVC.swift
//  CornFarmer
//
//  Created by 이상현 on 2022/05/04.
//

import UIKit

class MyPageVC: BaseVC {
    private let myPageView = MyPageView()

    override func loadView() {
      self.view = self.myPageView
    }
    
    override func viewDidLoad() {
      super.viewDidLoad()
        
        
    }
    
    static func instance() -> UINavigationController {
        let viewController = MyPageVC.init(nibName: nil, bundle: nil).then {
            $0.tabBarItem = UITabBarItem (
            title: "마이 페이지",
            image: nil,
            tag: TabBarTag.my.rawValue
            )
        }
        return UINavigationController(rootViewController: viewController)
    }
}
