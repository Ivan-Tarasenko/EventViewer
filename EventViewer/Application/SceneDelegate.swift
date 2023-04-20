//
//  SceneDelegate.swift
//  EventViewer
//
//  Created by Ilya Kharlamov on 1/26/23.
//

import SwiftUI
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    let eventManager: EventManager
    let dataSourse: TableViewDataSource
    let delegate: TableViewDelegate
    var window: UIWindow?
    
    override init() {
        self.eventManager = EventManager()
        self.dataSourse = TableViewDataSource()
        self.delegate = TableViewDelegate()
        super.init()
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UINavigationController(
            rootViewController: EventsListViewController(eventManager: eventManager, dataSourse: dataSourse, delegate: delegate)
        )
        self.window = window
        window.makeKeyAndVisible()
    }
    
}
