//
//  AddContactView.swift
//  Agenda
//
//  Created by Isaí on 24/07/22.
//

import SwiftUI

struct AddContactView: View {
    @State var name = ""
    @State var phone = ""
    @State var email = ""
    @State var address = ""
    @State var notes = ""
    
    let cardBackgroundColor = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    let cardShadowColor = Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
    let strokeTextFieldColor = Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
    let iconColor = Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
    let titleTextColor = Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1))
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
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(strokeTextFieldColor,lineWidth: 0.5))
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
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(strokeTextFieldColor,lineWidth: 0.5))
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
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(strokeTextFieldColor,lineWidth: 0.5))
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
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(strokeTextFieldColor,lineWidth: 0.5))
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
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(strokeTextFieldColor,lineWidth: 0.5))
                        Spacer()
                }
                
                Button("Aceptar") {
                    print("Button pressed")
                }
                .buttonStyle(BlueButton())
                .padding(10)
               
            }
        }.background(cardBackgroundColor)
    }
}

struct AddContactViewe_Preview: PreviewProvider {
    static var previews: some View {
        AddContactView()
    }
}
