//
//  WebView.swift
//  FirebaseTest
//
//  Created by 1 on 15.08.2024.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let url: URL
    
    let words: String
    
    init(words: String) {
        self.words = words
        self.url = URL(string: "https://www.google.com/search?q=\(words)")!
    }

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
