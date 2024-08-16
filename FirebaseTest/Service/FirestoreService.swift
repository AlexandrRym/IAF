//
//  FirestoreService.swift
//  FirebaseTest
//
//  Created by 1 on 12.08.2024.
//

import FirebaseFirestore
import Firebase

class FirestoreService {
    
    private var db = Firestore.firestore()
    
    func addElementToArray(documentId: String, arrayField: String, element: String, completion: @escaping (Result<Void, Error>) -> Void) {
           let docRef = db.collection("users").document(documentId)

           docRef.updateData([
               "\(arrayField)": FieldValue.arrayUnion([element])
           ]) { error in
               if let error = error {
                   print("Error updating document: \(error.localizedDescription)")
                   completion(.failure(error))
               } else {
                   print("Element added to array successfully.")
                   
                   completion(.success(()))
               }
           }
       }
    
    func removeElementToArray(documentId: String, arrayField: String, element: String, completion: @escaping (Result<Void, Error>) -> Void) {
           let docRef = db.collection("users").document(documentId)

           docRef.updateData([
            "\(arrayField)": FieldValue.arrayRemove([element])
           ]) { error in
               if let error = error {
                   print("Error updating document: \(error.localizedDescription)")
                   completion(.failure(error))
               } else {
                   print("Element added to array successfully.")
                   
                   completion(.success(()))
               }
           }
       }
    
    
    func fetchDocumentData(documentId: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        
        let docRef = db.collection("users").document(documentId)
        
        docRef.getDocument { (document, error) in
            if let error = error {
                print("Error fetching document: \(error.localizedDescription)")
                completion(.failure(error))
                
            } else {
                
                if let document = document, document.exists {
                    let data = document.data() ?? [:]
                    completion(.success(data))
                    
                } else {
                    print("Error: Document with ID \(documentId) does not exist")
                    let error = NSError(domain: "FirestoreError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Document does not exist"])
                    completion(.failure(error))
                }
            }
        }
    }
}
