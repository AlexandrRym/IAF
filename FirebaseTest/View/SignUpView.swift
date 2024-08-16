//
//  AuthView.swift
//  FirebaseTest
//
//  Created by 1 on 10.08.2024.
//
import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            Color.lightYellow
                .ignoresSafeArea()
                .onTapGesture {
                    hideKeyboard()
                }
            
            VStack {
                Image("SignUpManImage")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .padding(50)
                
                TextFieldCustomStyle(title: "Name", text: $viewModel.user.name)
                
                TextFieldCustomStyle(title: "Email", text: $viewModel.user.email)
                
                TextFieldCustomStyle(title: "Password", text: $viewModel.user.password)
                
                SplashButtonView(label: "Register") {
                    viewModel.registerNewUser()
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    SignUpView()
        .environmentObject(AuthViewModel())
}

