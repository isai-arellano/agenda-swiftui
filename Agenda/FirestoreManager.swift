//
//  FirestoreManager.swift
//  Agenda
//
//  Created by Isaí on 25/07/22.
//

import Foundation
import Firebase
import FirebaseFirestore

class FirestoreManager : ObservableObject {
    @Published var contact: String = ""
    
    init(){
        fetchContact()
        fetchAllContacts()
    }
    
    func fetchContact(){
        let db = Firestore.firestore()
        
        let docRef = db.collection("contacts").document("EwizTyjFlgpuaJVNAr1b")
        
        docRef.getDocument { (document, error) in
            guard error == nil else {
                print("error", error ?? "")
                return
            }
            
            if let document = document , document.exists {
                let data = document.data()
                if let data = data {
                    print("Data", data)
                    self.contact = data["name"] as? String ?? ""
                }
            }
            
        }
        
    }
    
    func fetchAllContacts(){
        let db = Firestore.firestore()
        
        db.collection("contacts").getDocuments() { (querySpashot, error) in
            if let error = error {
                print("Error getting contacts: \(error)")
            }else {
                for document in querySpashot!.documents {
                    print("\(document.documentID): \(document.data())")
                }
            }
            
        }
    }
    
    
}
