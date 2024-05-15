//
//  settingsPage.swift
//  Social Media App
//
//  Created by StudentAM on 4/23/24.
//

import SwiftUI

struct settingsPage: View {
    @Binding var userData: [Users]
    @Binding var accInfo : [accInfo]
    
    @State private var password: String = ""
    @State private var username: String = ""
    @State private var phonenum: String = ""
    @State private var email: String = ""
    @State private var bio: String = ""
    @State private var pronouns: String = ""
    @State private var stateCountry: String = ""
    
    var body: some View {
        VStack{
            Text("Settings")
            TextField("change password", text: $password)
                .border(Color.black)
                .frame(width:200)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .cornerRadius(3.0)
                .padding()
            TextField("Change Username", text: $username)
                .border(Color.black)
                .frame(width:200)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .cornerRadius(3.0)
                .padding()
            TextField("Change phone#", text: $phonenum)
                .border(Color.black)
                .frame(width:200)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .cornerRadius(3.0)
                .padding()
            TextField("change email", text: $email)
                .border(Color.black)
                .frame(width:200)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .cornerRadius(3.0)
                .padding()
            
            Button(action: {}, label: {
                Text("save changes")
            })
            .padding()
            TextField("bio", text: $bio)
                .border(Color.black)
                .frame(width:200)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .cornerRadius(3.0)
                .padding()
            TextField("pronouns", text: $pronouns)
                .border(Color.black)
                .frame(width:200)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .cornerRadius(3.0)
                .padding()
            TextField("state/Country", text: $stateCountry)
                .border(Color.black)
                .frame(width:200)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .cornerRadius(3.0)
                .padding()
            Button(action: {}, label: {
                Text("save changes")
            })
        }
    }
}

#Preview {
    settingsPage(userData: .constant([]), accInfo: .constant([]))
}
