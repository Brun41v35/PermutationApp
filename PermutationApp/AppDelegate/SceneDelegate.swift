//
//  SceneDelegate.swift
//  PermutationApp
//
//  Created by Bruno Silva on 13/10/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // MARK: - Public Properties
    
    var window: UIWindow?
    
    // MARK: - Public Methods
    
    func permutationViewController() -> UINavigationController {
        let viewModel = PermutationViewModel()
        let factory = PermutationFactory()
        let viewController = PermutationViewController(factory: factory,
                                                       viewModel: viewModel)
        return UINavigationController(rootViewController: viewController)
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = permutationViewController()
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}

