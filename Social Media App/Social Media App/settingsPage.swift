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
                
                Button(action: {
                    self.updateUserInfo()
                },
                    label: {
                        Text("Save changes")
                    })
                .padding()
                .padding()
                TextField("Bio", text: $bio)
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
                Button(action: {
                    self.changeProfileInfo()
                },
                    label: {
                        Text("Save changes")
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
        print("function launched")
        if let index = userData.firstIndex(where: { $0.username == accountIn }) {
            // Update the user's login details
            print("user found in \(index) index.")
            if password != "" {
                userData[index].password = password
                print("info entered has been changed")
            }
            if username != "" {
                userData[index].username = username
                print("info entered has been changed")
            }
            if phonenum != "" {
                userData[index].phonenum = phonenum
                print("info entered has been changed")
            }
            if email != "" {
                userData[index].email = email
                print("info entered has been changed")
            }
            alertOn = true
            alertmessage = "info entered has been changed"
            print("info entered has been changed")
        }
        else {
            alertOn = true
            alertmessage = "Please enter one change before saving"
        }
    }
    func changeProfileInfo()
    {
        print("function 2 launched")
        if let index = accInfo1.firstIndex(where: { $0.username == accountIn})
        {
            print("user found in \(index) index.")
            if bio != ""
            {
                accInfo1[index].bio = bio
                print("info entered has been changed")
            }
            if pronouns != ""
            {
                accInfo1[index].pronouns = pronouns
                print("info entered has been changed")

            }
            if stateCountry != ""
            {
                accInfo1[index].stateCountry = stateCountry
                print("info entered has been changed")
            }
            alertmessage = "info entered has been changed"
            alertOn = true
            print("info entered has been changed")
        }
        else
        {
            print("nothing has been found")
            if bio.isEmpty || pronouns.isEmpty || stateCountry.isEmpty
            {
                alertmessage = "please enter all of the fields"
                alertOn = true
            }
            else
            {
                var info = accInfo(username: username, bio: bio, pronouns: pronouns, stateCountry: stateCountry)
                accInfo1.append(info)
                alertmessage = "info has been sucsessfully changed"
                alertOn = true
            }
        }
    }
}

#Preview {
    settingsPage(userData: .constant([]), accInfo1: .constant([]), accountIn: "")
}
