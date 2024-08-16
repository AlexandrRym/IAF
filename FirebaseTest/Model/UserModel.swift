//
//  UserModel.swift
//  FirebaseTest
//
//  Created by 1 on 10.08.2024.
//

import Foundation

class UserModel:ObservableObject{
    var name:String
    var email:String
    var password:String
    var arrayWords : [String]
    init(name: String, email: String, password: String , arrayWords : [String]) {
        self.name = name
        self.email = email
        self.password = password
        self.arrayWords = ["dependency injection" , "экзистенциальный контейнер"]
    }
}
