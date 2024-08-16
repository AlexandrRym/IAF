//
//  SplashPage.swift
//  FirebaseTest
//
//  Created by 1 on 13.08.2024.
//

import SwiftUI

struct SplashPage : View {
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        NavigationStack{
            ZStack {
                Color.lightYellow
                    .ignoresSafeArea()
                VStack{
                    Text("IAF")
                        .font(.largeTitle)
                        .bold()
                        .fontDesign(.monospaced)
                    
                    Image("splashManImage")
                        .resizable()
                        .frame(width: 300 , height: 300)
                   
                        NavigationLink {
                            SignInView(viewModel: _viewModel)
                        } label: {
                            RoundedText(label: "Sign In")
                        }
                        NavigationLink {
                            SignUpView(viewModel: _viewModel)
                        } label: {
                            RoundedText(label: "Sign Up")
                        }
                    
                }.padding(.bottom , 25)
            }
        }
    }
}


#Preview {
    SplashPage()
}
