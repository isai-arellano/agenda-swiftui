//
//  ContactListView.swift
//  Agenda
//
//  Created by Isaí on 26/07/22.
//

import SwiftUI
import Firebase

struct ContactListView: View {
    @StateObject var firestoreManager = FirestoreManager()
    
    
    var body: some View {
        NavigationView{
            List (){
                ForEach(firestoreManager.contacts) { contact in
                    VStack (alignment: .leading, spacing: 8){
                        Text(contact.name).font(.title)
                        Text("Tel: " + contact.phone).font(.subheadline).foregroundColor(.secondary)
                        Text("Domicilio: " + contact.address).font(.subheadline).foregroundColor(.secondary)
                        Text("Correo: " + contact.email).font(.subheadline).foregroundColor(.secondary)
                        Text("Nota: " + contact.notes).font(.subheadline).foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle(Text("Contactos"))
            .onAppear(){
                self.firestoreManager.getAllContacts()
            }
        }
    }
}

struct ContactListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactListView()
            .environmentObject(FirestoreManager())
    }
}

struct ContactData: Identifiable {
    var id = String()
    var name: String
    var phone: String
    var email: String
    var address: String
    var notes: String
}

/*let contactsData = [
    
]*/
