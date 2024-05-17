//
//  settingsPage.swift
//  Social Media App
//
//  Created by StudentAM on 4/23/24.
//

import SwiftUI

struct settingsPage: View {
    @Binding var userData: [Users]
    @Binding var accInfo1 : [accInfo]
    
    @State private var name:String = ""
    @State private var password: String = ""
    @State private var username: String = ""
    @State private var phonenum: String = ""
    @State private var email: String = ""
    @State private var bio: String = ""
    @State private var pronouns: String = ""
    @State private var stateCountry: String = ""
    
    @State var accountIn: String
    @State var alertOn = false
    @State var alertmessage = ""
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [.purple, .orange]), startPoint: .top, endPoint: .bottom))
            VStack{
                Text("Settings")
                    .font(.title)
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
                
                Button(action: {}, label: {
                    Text("save changes")
                })
                .padding()
                Text("Bio:")
                    .padding(.bottom, -16)
                TextEditor(text: $bio)
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
            .padding(30)
            .shadow(radius: 10)
            .cornerRadius(3)
            .alert(isPresented: $alertOn) {
                Alert(title: Text("Sign In"), message: Text(alertmessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    func updateUserInfo() {
        // Find the user whose login details need to be updated
        if let index = userData.firstIndex(where: { $0.username == accountIn }) {
            // Update the user's login details
            if password != "" {
                userData[index].password = password
            }
            if username != "" {
                userData[index].username = username
            }
            if phonenum != "" {
                userData[index].phonenum = phonenum
            }
            if email != "" {
                userData[index].email = email
            }
        } 
        else {
            alertOn = true
            alertmessage = "Please enter one change before saving"
        }
    }
    func changeProfileInfo()
    {
        if let index = accInfo1.firstIndex(where: { $0.username == accountIn})
        {
            if bio != ""
            {
                accInfo1[index].bio = bio
            }
            if pronouns != ""
            {
                accInfo1[index].pronouns = pronouns

            }
            if stateCountry != ""
            {
                accInfo1[index].stateCountry = stateCountry
            }
        }
        else
        {
            if bio.isEmpty || pronouns.isEmpty || stateCountry
            var info = accInfo(username: username, bio: bio, pronouns: pronouns, stateCountry: stateCountry)
            accInfo1.append(info)
        }
    }
}

#Preview {
    settingsPage(userData: .constant([]), accInfo1: .constant([]), accountIn: "")
}
