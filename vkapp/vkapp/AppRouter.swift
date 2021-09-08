//
//  AppRouter.swift
//  vkapp
//
//  Created by Pavel Lazarev on 08.09.2021.
//

import UIKit

class AppRouter {
    
    private func loginScene() -> UIViewController {
        guard let loginViewController = Constant.Storyboard.login.instantiateInitialViewController() as? LoginViewController else {
            fatalError("ошибка добавления Login.storyboard, экрана или класса")
        }
        
        return loginViewController
    }
    
    private func mainScene() -> UIViewController {
        guard let mainNavigationController = Constant.Storyboard.main.instantiateInitialViewController() as? UITabBarController else {
            fatalError("ошибка добавления Main.storyboard, экрана или класса")
        }
        
        mainNavigationController.modalPresentationStyle = .fullScreen
        return mainNavigationController
    }
    
    private func debugScene() -> UIViewController {
        guard let debugViewController = Constant.Storyboard.debug.instantiateInitialViewController() as? UINavigationController else {
            fatalError("ошибка добавления Debug.storyboard, экрана или класса")
        }
        
        return debugViewController
    }
    
    public func handleWindow(_ window: UIWindow?) {
        window?.rootViewController = loginScene()
        window?.makeKeyAndVisible()
    }
    
    public func presentMainScene(from viewController: UIViewController) {
        viewController.present(mainScene(), animated: true)
    }
    
    public func presentDebugScene(from viewController: UIViewController) {
        viewController.present(debugScene(), animated: true)
    }
}
