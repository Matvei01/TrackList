//
//  SceneDelegate.swift
//  TrackList
//
//  Created by Matvei Khlestov on 10.04.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let viewController = UINavigationController(rootViewController: TrackListViewController())
        window.rootViewController = viewController
        self.window = window
        window.makeKeyAndVisible()
    }
}

