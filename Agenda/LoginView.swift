//
//  LoginView.swift
//  Agenda
//
//  Created by Isaí on 25/07/22.
//

import SwiftUI
import Firebase

struct LoginView: View {
    let backGroundColor = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    let strokeTextFieldColor = Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
    let colorWhite = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    let titleText = Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1))
    @State var show = false
    @State var email = ""
    @State var password = ""
    @State private var isPresenting = false
    @State var alertMessage = "Algo salió mal"
    @State var showAlert = false
    
    var body: some View {
        VStack {
            VStack{
                Text("Login")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(titleText)
                
                TextField("Email", text: $email)
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(strokeTextFieldColor,lineWidth: 0.5))
                    .foregroundColor(titleText)
                
                SecureField("Password", text: $password)
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(strokeTextFieldColor,lineWidth: 0.5))
                    .foregroundColor(titleText)
                
                Button("Login"){
                    login()
                }
                .buttonStyle(BlueButton())
                .padding(10)
            }
            .padding()
            
            }.fullScreenCover(isPresented: $isPresenting,
                          onDismiss: { isPresenting = false }, content: {
                            ContentView()
            })
            .alert(isPresented: $showAlert){
                Alert(title: Text("Error"), message: Text(self.alertMessage), dismissButton: .default(Text("OK")))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(backGroundColor)
            .ignoresSafeArea()
    }
    
    
    // Methods
    func login(){
        Auth.auth().signIn(withEmail: email, password: password) {
            (result, error) in
            if error != nil {
                self.alertMessage = error?.localizedDescription ?? ""
                self.showAlert = true
            } else {
              isPresenting = true
              print("success")
            }
        }
    }
    
    
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


