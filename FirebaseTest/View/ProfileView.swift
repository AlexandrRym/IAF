//
//  ProfileView.swift
//  FirebaseTest
//
//  Created by 1 on 12.08.2024.
//

import FirebaseFirestore
import SwiftUI

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    
    @EnvironmentObject var auyhViewModel: AuthViewModel
    
    let userId: String

    var body: some View {
        ZStack {
            Color.lightYellow
                .ignoresSafeArea()
            
        VStack {
            if let name = viewModel.userData["name"] as? String {
                TextFormatString(label: "Name: \(name)").padding(.vertical , 10)
            } else {
                TextFormatString(label: "Name: Loading...").padding(.vertical , 10)
            }
            
            if let email = viewModel.userData["email"] as? String {
                TextFormatString(label: "Email: \(email)")
            } else {
                TextFormatString(label: "Email: Loading...")
            }
            Spacer()
            
            SplashButtonView( label:" Clear User Defaults", action: auyhViewModel.clearUserDefaults)
            
        }.padding(20)
        .onAppear {
            viewModel.fetchUserData(userId: userId)
            }
        }
    }
}

