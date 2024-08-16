//
//  ProfileViewModel.swift
//  FirebaseTest
//
//  Created by 1 on 12.08.2024.
//

import FirebaseFirestore

class ProfileViewModel: ObservableObject {
    
    @Published var userData: [String: Any] = [:]
    @Published var errorMessage: String?
    
    private let firestoreService = FirestoreService()
    
    func removeElementToArray(userId: String, arrayField: String, element: String) {
           firestoreService.removeElementToArray(documentId: userId, arrayField: arrayField, element: element) { result in
               switch result {
                   
                   case .success() :
                       self.fetchUserData(userId: userId)
                       DispatchQueue.main.async {
                           print("Element added to array successfully.")
                    }
                   
                   case .failure(let error) :
                       DispatchQueue.main.async {
                           self.errorMessage = error.localizedDescription
                           print("Failed to add element to array: \(error.localizedDescription)")
                    }
                }
           }
       }
    
    func addElementToArray(userId: String, arrayField: String, element: String) {
           firestoreService.addElementToArray(documentId: userId, arrayField: arrayField, element: element) { result in
               switch result {
                   case .success():
                       self.fetchUserData(userId: userId)
                       DispatchQueue.main.async {
                           print("Element added to array successfully.")
                       }
                   case .failure(let error):
                       DispatchQueue.main.async {
                           self.errorMessage = error.localizedDescription
                           print("Failed to add element to array: \(error.localizedDescription)")
                    }
                }
            }
       }
    
    func fetchUserData(userId: String) {
        firestoreService.fetchDocumentData(documentId: userId) { result in
            switch result {
                
            case .success(let data):
                DispatchQueue.main.async {
                    self.userData = data
                }
                
            case .failure(let error):
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    print("Failed to fetch data: \(error.localizedDescription)")
                }
            }
        }
    }
}
