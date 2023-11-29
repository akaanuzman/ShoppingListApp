//
//  TabBarVC.swift
//  ShoppingListApp
//
//  Created by Kaan Uzman on 30/11/23.
//

import UIKit

final class TabBarVC: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().tintColor = .systemGreen
        viewControllers = [
            createShoppingListVC(),
            createDoneListVC(),
            createSettingsVC()
        ]
    }

    private func createShoppingListVC() -> UINavigationController {
        let navBarTitle = "Shopping List"
        let title = "Shop"

        let shoppingListVC = ShoppingListVC()
        shoppingListVC.title = navBarTitle

        shoppingListVC.tabBarItem = UITabBarItem(
            title: title,
            image: SFSymbols.cart,
            selectedImage: SFSymbols.cartFill
        )
        return UINavigationController(rootViewController: shoppingListVC)
    }

    private func createDoneListVC() -> UINavigationController {
        let title = "Done"
        let doneListVC = DoneListVC()
        doneListVC.title = "Done List"
        doneListVC.tabBarItem = UITabBarItem(
            title: title,
            image: SFSymbols.checkmarkCircle,
            selectedImage: SFSymbols.checkmarkCircleFill
        )
        return UINavigationController(rootViewController: doneListVC)
    }

    private func createSettingsVC() -> UINavigationController {
        let settingsVC = SettingsVC()
        let title = "Settings"
        settingsVC.title = title
        settingsVC.tabBarItem = UITabBarItem(
            title: title,
            image: SFSymbols.gearshape,
            selectedImage: SFSymbols.gearshapeFill
        )

        return UINavigationController(rootViewController: settingsVC
        )
    }
}

#Preview {
    TabBarVC()
}
