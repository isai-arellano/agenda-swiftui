//
//  ContentView.swift
//  Agenda
//
//  Created by Isaí on 24/07/22.
//

import SwiftUI

struct ContentView: View {
    let backGroundColor = Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1))
    let textColor =  Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    @State var show = false
    @State var showAddContactView = false
    
    var body: some View {
        VStack {
            HStack{
                Text("Agenda")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(textColor)
                Spacer()
            }
            .padding(.leading, 14)
            .padding(.horizontal)
            .padding(.top,50)
           
            Spacer()
            VStack{
                Button(action: {
                    self.showAddContactView.toggle()
                } ) {
                   Text("Agregar contacto")
                }
                .sheet(isPresented: $showAddContactView){
                    AddContactView()
                }
                .buttonStyle(BlueButton())
                
                Button(action: {
                    self.showAddContactView.toggle()
                } ) {
                   Text("Ver contactos")
                }
                .sheet(isPresented: $showAddContactView){
                    AddContactView()
                }
                .buttonStyle(BlueButton())
                
            }
            .padding(.horizontal, 15)
            Spacer()
        }
        .background(
                    ZStack {
                        Image("Blob")
                            .offset(x: -150, y: -200)
                            .rotationEffect(Angle(degrees: show ? 360+90 : 90))
                            .blendMode(.plusDarker)
                            .animation(Animation.linear(duration: 120).repeatForever(autoreverses: false))
                            .onAppear{ self.show = true }
                        
                        Image("Blob")
                            .offset(x: -200, y: -250)
                            .rotationEffect(Angle(degrees: show ? 360 : 0),anchor: .leading)
                            .blendMode(.overlay)
                            .animation(Animation.linear(duration: 120).repeatForever(autoreverses: false))
                    }.padding()
                )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backGroundColor)
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct BlueButton: ButtonStyle {
    let btnColor = Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1))
    var btnShadowColor = Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
                    .padding(12)
                    .padding(.horizontal, 15)
                    .background(btnColor)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10,style: .continuous))
                    .shadow(color: btnShadowColor.opacity(0.3), radius: 20, x: 0, y: 20)
                    .scaleEffect(configuration.isPressed ? 1.2 : 1)
                    .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
                    .frame(width: 200)
    }
}

