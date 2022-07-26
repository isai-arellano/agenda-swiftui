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
    @Published var contacts = [ContactData]()
    
    init(){
        fetchContact()
        fetchAllContacts()
    }
    
    func createContact(id: String,name: String, phone: String, email: String, address: String, notes: String){
        let db = Firestore.firestore()
        let docREF = db.collection("contacts").document(name)
        
        docREF.setData(["id": id,"name": name, "phone": phone, "email": email, "address": address, "notes": notes]) { error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document successfully written")
            }
        }
        
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
                    print("\(document.data())")
                }
            }
            
        }
    }
    
    func getAllContacts(){
        let db = Firestore.firestore()
        
        db.collection("contacts").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("Error getting contacts")
                return
            }
            self.contacts = documents.map { (queryDocumentsnapshot) -> ContactData in
                let data = queryDocumentsnapshot.data()
                
                let id = data["id"] as? String ?? ""
                let name = data["name"] as? String ?? ""
                let phone = data["phone"] as? String ?? ""
                let email = data["email"] as? String ?? ""
                let address = data["address"] as? String ?? ""
                let notes = data["notes"] as? String ?? ""
                
                return ContactData(id: id, name: name, phone: phone, email: email, address: address, notes: notes)
            }
        }
        
    }
    
    
}


