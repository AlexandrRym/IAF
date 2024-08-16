//
//  ElementOfWords.swift
//  FirebaseTest
//
//  Created by 1 on 15.08.2024.
//

import SwiftUI

struct ElementOfWords: View {
    
    var name:String
    
    var viewModel: ProfileViewModel
    
    var userId : String
    
    var body: some View {
        HStack{
            NavigationLink(destination: WebView(words: name)) {
                TextFormatString(label: name)
            }
            Spacer()
            Image(systemName: "trash")
                .resizable()
                .frame(width: 20 , height: 20)
                .padding(20)
                .onTapGesture {
                    print(name)
                    viewModel.removeElementToArray(userId: userId, arrayField: "arrayWords", element: name)
                }
            }
    }
}
