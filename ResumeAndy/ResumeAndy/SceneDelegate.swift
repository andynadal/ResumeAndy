//
//  SceneDelegate.swift
//  ResumeAndy
//
//  Created by Andy Nadal on 11/03/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        
        let viewController = TabSelectorController()
        window.rootViewController = viewController
        
        window.makeKeyAndVisible()
    }
}
