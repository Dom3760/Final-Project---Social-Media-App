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
    @State var showingAlert:Bool = false
    @State private var alertMessage = ""
    @Binding var signedIn: Bool
    @State var post2: [Post]
    
    @Binding var accountIn: String
    @State var accounts:[Users]
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView
        {
            VStack
            {
                ZStack
                {
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.purple, .orange]), startPoint: .top, endPoint: .bottom))
                    //                    .frame()
                    Rectangle()
                        .border(Color.black)
                        .foregroundColor(.white)
                        .frame(width: 350, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(3)
                        .shadow(radius: 10)
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
                        Button("Sign In"){
                            signIn()
                        }
                        .padding()
                        .border(Color.black)
                        .background(.blue)
                        .foregroundColor(.white)
                    }
                }
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Sign In"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            
            NavigationLink(destination: ContentView(), isActive: $signedIn) {
                EmptyView()
            }
        }
    }
    func signIn() {
//        print(accounts)
//        print(signedIn)
        for account in accounts {
            if account.username == Username && account.password == Password{
                alertMessage = "Sign in successful!"
                showingAlert = true
                accountIn = Username
                presentationMode.wrappedValue.dismiss()
                signedIn = true
            }
        }
        
        
        if !signedIn
        {
            alertMessage = "Invalid username or password"
            showingAlert = true
        }
    }
}

#Preview {
    signInPage(signedIn:(.constant(false)) , post2:[], accountIn: .constant("hello"), accounts:[])
}
