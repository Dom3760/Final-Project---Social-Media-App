//
//  signUpPage.swift
//  Social Media App
//
//  Created by StudentAM on 4/23/24.
//

import SwiftUI

struct signUpPage: View {
    @Binding var accInfo: [Users]
    
    @State var email : String = ""
    @State var username : String = ""
    @State var password : String = ""
    @State var phone : String = ""
    @State var name : String = ""
    
    @State var alert : Bool = false
    @State var alertMessage = ""
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [.purple, .orange]), startPoint: .top, endPoint: .bottom))
            VStack
            {
                Text("Sign Up")
                    .padding()
                TextField("Name", text: $name)
                    .border(Color.black)
                    .frame(width:200)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(3.0)
                    .padding()
                TextField("Email", text: $email)
                    .border(Color.black)
                    .frame(width:200)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(3.0)
                    .padding()
                TextField("Username", text: $username)
                    .border(Color.black)
                    .frame(width:200)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(3.0)
                    .padding()
                TextField("Password", text: $password)
                    .border(Color.black)
                    .frame(width:200)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(3.0)
                    .padding()
                TextField("phone #", text: $phone)
                    .border(Color.black)
                    .frame(width:200)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(3.0)
                    .padding(.top)
                Button(action: makeAcc, label: {
                    Text("Make account")
                })
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .border(Color.black)
                .cornerRadius(10)
                .padding()
            }
            .frame(width: 300)
            .background(Color.white)
            .cornerRadius(6.0)
            .border(Color.black)
            .padding()
            .alert(isPresented: $alert) {
                Alert(title: Text("Sign In"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
        }
    }
    func makeAcc() {
        print(accInfo)
        if email == "" || username == "" || password == "" || phone == "" || name == "" {
            alertMessage = "missing field above"
            alert = true
        } else {
            var newAcc = Users(email: email, username: username, password: password, phonenum: phone, name: name)
            accInfo.append(newAcc)
            alertMessage = "account successfully created"
            alert = true
            presentationMode.wrappedValue.dismiss()
            print(accInfo)
        }
    }
}

#Preview {
    signUpPage(accInfo: .constant([]))
}
