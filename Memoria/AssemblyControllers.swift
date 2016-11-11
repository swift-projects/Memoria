
import Foundation
import Swinject
import UIKit

open class AssemblyControllers {
    
    class func run(_ container : Container) {
        container.register(TabBarController.self) { c in
            let tabBar = TabBarController()
            guard let left = c.resolve(TaskManagerViewController.self) else {return tabBar}
            guard let  _ = c.resolve(MemoriesViewController.self) else {return tabBar}
            guard let _ = c.resolve(DrugsViewController.self) else {return tabBar}
            let controllers = [left]
            tabBar.viewControllers = controllers
            left.tabBarItem = UITabBarItem(
                title: Content.getContent(ContentType.labelTxt, name: "TabBarTasksLbl"),
                image: UIImage(named: "TasksManagerLogoTabOnlyImage"),
                tag: 1)
            tabBar.selectedIndex = 1
            return tabBar
        }
        
        container.register(NavigationController.self) { c in
            let navigationController = NavigationController(rootViewController : c.resolve(TabBarController.self)!)
            return navigationController
        }
    }
}
