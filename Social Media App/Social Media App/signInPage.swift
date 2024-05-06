//
//  signInPage.swift
//  Social Media App
//
//  Created by StudentAM on 4/23/24.
//

import SwiftUI

struct signInPage: View {
    @State var Username:String = ""
    @State var Password:String = ""
    @State var accounts:[Post]
    @State var signedIn: Bool = false
    @State var account 
    var body: some View {
        VStack
        {
            ZStack
            {
                Rectangle()
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .frame(width: 350, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                VStack {
                    Text("Sign In")
                        .font(.largeTitle)
                    TextField("Username", text: $Username)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                        .frame(width:200)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    TextField("Password", text: $Password)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                        .frame(width:200)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        .padding()
                    Button(action: signIn(), label: {
                        Text("Sign In")
                    })
                    .padding()
                    .border(Color.black)
                    .background(.blue)
                    .foregroundColor(.white)
                }
            }
        }
    }
    func signIn()
    {
        var found = false
        var index = 0
        for i in accounts
        {
            if accounts[i][1] == Username
            {
                index = i
                break
            }
        }
        if found == false
        {
            alert
        }
        else
        {
            for i in accounts
            {
                if accounts[index][2] == Password
                {
                    
                }
            }
        }
    }
}

#Preview {
    signInPage(accounts: [Post])
}
