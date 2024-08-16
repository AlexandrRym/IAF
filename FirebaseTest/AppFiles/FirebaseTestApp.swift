//
//  FirebaseTestApp.swift
//  FirebaseTest
//
//  Created by 1 on 09.08.2024.
//

import SwiftUI
import Firebase


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

import SwiftUI

@main
struct YourApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject private var authViewModel = AuthViewModel()

    var body: some Scene {
        WindowGroup {
            if authViewModel.isAuth {
                TabView {
                    HomeView(userId: authViewModel.userId)
                        .tabItem {
                        Label("IAF", systemImage: "archivebox")
                    }
                       
                    ProfileView(userId: authViewModel.userId)
                        .tabItem {
                        Label("Profile", systemImage: "person")
                    }
                } 
                .environmentObject(authViewModel)
            } else {
                SplashPage()
                  .environmentObject(authViewModel)
            }
        }
    }
}
