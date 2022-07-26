//
//  AddContactView.swift
//  Agenda
//
//  Created by Isaí on 24/07/22.
//

import SwiftUI

struct AddContactView: View {
    @EnvironmentObject var firestoreManager: FirestoreManager
    
    @State var name = ""
    @State var phone = ""
    @State var email = ""
    @State var address = ""
    @State var notes = ""
    
    let cardBackgroundColor = Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    let iconColor = Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
    let titleTextColor = Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1))
    let foreGroundColor = Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
    var body: some View {
        ScrollView {
            VStack{
                Text("Agregar contacto")
                    .bold()
                    .font(.title)
                    .padding(20)
                    .foregroundColor(titleTextColor)
                HStack{
                    Image(systemName: "person.fill")
                                                .foregroundColor(iconColor)
                                                .frame(width: 44, height: 44)
                                                .background(Color.white)
                                                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                                .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                                                .padding(10)
                    TextField("Nombre", text: $name)
                        .padding(.horizontal,16)
                        .foregroundColor(foreGroundColor)
                        .padding(.vertical, 16)
                        .frame(width: 335, height: 52, alignment: .leading)
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(10)
                    Spacer()
                }
                HStack{
                    Image(systemName: "phone.fill")
                                                .foregroundColor(iconColor)
                                                .frame(width: 44, height: 44)
                                                .background(Color.white)
                                                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                                .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                                                .padding(10)
                    TextField("Teléfono", text: $phone)
                        .padding(.horizontal,16)
                        .foregroundColor(foreGroundColor)
                        .padding(.vertical, 16)
                        .frame(width: 335, height: 52, alignment: .leading)
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(10)
                    Spacer()
                }
                HStack{
                    Image(systemName: "envelope.fill")
                                                .foregroundColor(iconColor)
                                                .frame(width: 44, height: 44)
                                                .background(Color.white)
                                                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                                .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                                                .padding(10)
                    TextField("Email", text: $email)
                        .padding(.horizontal,16)
                        .foregroundColor(foreGroundColor)
                        .padding(.vertical, 16)
                        .frame(width: 335, height: 52, alignment: .leading)
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(10)
                    Spacer()
                }
                HStack{
                    Image(systemName: "house.fill")
                                                .foregroundColor(iconColor)
                                                .frame(width: 44, height: 44)
                                                .background(Color.white)
                                                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                                .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                                                .padding(10)
                    TextField("Dirección", text: $address)
                        .padding(.horizontal,16)
                        .foregroundColor(foreGroundColor)
                        .padding(.vertical, 16)
                        .frame(width: 335, height: 52, alignment: .leading)
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(10)
                    Spacer()
                }
                HStack{
                    Image(systemName: "note.text")
                                                .foregroundColor(iconColor)
                                                .frame(width: 44, height: 44)
                                                .background(Color.white)
                                                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                                .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                                                .padding(10)
                    TextField("Notas", text: $notes)
                        .padding(.horizontal,16)
                        .foregroundColor(foreGroundColor)
                        .padding(.vertical, 16)
                        .frame(width: 335, height: 52, alignment: .leading)
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(10)
                        Spacer()
                }
                
                Button("Aceptar") {
                    createContact()
                }
                .buttonStyle(BlueButton())
                .padding(10)
               
            }
        }.background(cardBackgroundColor)
    }
    
    func createContact(){
        let uuid = UUID().uuidString
        firestoreManager.createContact(id: uuid, name: name, phone: phone, email: email, address: address, notes: notes)
        name = ""
        phone = ""
        email = ""
        address = ""
        notes = ""
    }
}



struct AddContactViewe_Preview: PreviewProvider {
    static var previews: some View {
        AddContactView()
            .environmentObject(FirestoreManager())
    }
}
