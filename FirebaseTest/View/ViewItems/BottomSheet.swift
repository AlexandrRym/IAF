//
//  BottomSheet.swift
//  FirebaseTest
//
//  Created by 1 on 15.08.2024.
//

import Foundation

import SwiftUI

struct BottomSheet: View {
    @Binding var isPresented: Bool
    
    @Binding var inputText: String
    
    var onSubmit: () -> Void

    var body: some View {
        ZStack{
            Color.lightYellow.ignoresSafeArea()
            VStack {
                Spacer()
                VStack(spacing: 20) {
                    TextFieldCustomStyle(title: "Enter text", text: $inputText)
                    
                    SplashButtonView(label:("Submit")) {
                        onSubmit()
                        isPresented = false
                    }
                }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .presentationDetents([.fraction(0.3)])
        }
    }
}
