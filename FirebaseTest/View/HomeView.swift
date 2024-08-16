//
//  ContentView.swift
//  FirebaseTest
//
//  Created by 1 on 09.08.2024.
//

import SwiftUI
struct HomeView: View {

@StateObject private var viewModel = ProfileViewModel()

    @State private var showSheet = false
    @State private var inputText = ""

    let userId: String

    var body: some View {
        NavigationStack{
            ZStack {
                Color.lightYellow
                    .ignoresSafeArea()
                VStack {
                    TextFormatString(label: "I always forget🤫").padding(.vertical , 20)
                    ScrollView{
                        if let name = viewModel.userData["arrayWords"] as? [String] {
                            ForEach(name, id: \.self) { name in
                                    ElementOfWords(name: name, viewModel: viewModel, userId: userId)
                                }
                        } else {
                            TextFormatString(label: "Requests: Loading...").padding(.vertical , 10)
                        }
                    }
                    Spacer()
                    SplashButtonView(label: "tuped", action: {
                        showSheet = true
                    } )
                    .sheet(isPresented: $showSheet) {
                        BottomSheet(isPresented: $showSheet, inputText: $inputText) {
                            viewModel.addElementToArray(userId: userId, arrayField: "arrayWords", element: inputText)
                            inputText = ""
                        }
                    }
                }
            }
        }.onAppear {
            viewModel.fetchUserData(userId: userId)
        }
    }
}
