//
//  Feed_The_CatApp.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/1/22.
//

import SwiftUI
import Firebase

final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        //FirebaseApp.configure()
        configureAppearence()
        return true
    }
    
    private func configureAppearence() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Molle-Regular", size: 32)!, .foregroundColor: UIColor(Resources.Colors.main)]
        UITableView.appearance().backgroundColor = UIColor(Resources.Colors.background)
        UINavigationBar.appearance().barTintColor = UIColor(Resources.Colors.background)
        UIBarButtonItem.appearance().tintColor = UIColor(Resources.Colors.main)
        let itemAppearance = UITabBarItemAppearance()
        itemAppearance.selected.iconColor = UIColor(Resources.Colors.main)
        itemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor(Resources.Colors.main)]
        
        let appeareance = UITabBarAppearance()
        appeareance.configureWithOpaqueBackground()
        appeareance.stackedLayoutAppearance = itemAppearance
        appeareance.inlineLayoutAppearance = itemAppearance
        appeareance.compactInlineLayoutAppearance = itemAppearance
        
        UITabBar.appearance().standardAppearance = appeareance
    }
}

@main
struct Feed_The_CatApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(Service())
                .environmentObject(AppState())
        }
    }
}
