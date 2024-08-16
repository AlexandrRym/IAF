//
//  SignInView.swift
//  FirebaseTest
//
//  Created by 1 on 14.08.2024.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            Color.lightYellow
                .ignoresSafeArea() 
                .onTapGesture {
                    // Dismiss the keyboard when tapping outside
                    hideKeyboard()
                }
            VStack{
                Image("SignInManImage")
                    .resizable()
                    .frame(width: 300 , height: 300)
               
                
                TextFieldCustomStyle(title: "Email", text: $viewModel.user.email)
                
                TextFieldCustomStyle(title: "Password", text: $viewModel.user.password)
                
                SplashButtonView(label: "Log In"){
                    viewModel.signIn()
                }
            }
        }
    }
}

#Preview {
    SignInView()
        .environmentObject(AuthViewModel())
}
