//
//  accountPage.swift
//  Social Media App
//
//  Created by StudentAM on 4/23/24.
//

import SwiftUI

struct accountPage: View {
    @State var username = "Username"
    @State var bio = "lorem"
    @State var pronouns = "he/him"
    @State var stateCountry = "CA/USA"
    @State var postB = true
    @State var picturesB = false
    @State var allB = false
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Circle()
                        .frame(width: 100, height: 100)
        //            Image("")
                }
                Text(username)
            }
            HStack
            {
                Text(pronouns)
                Text(stateCountry)
            }
            Text("bio: \(bio)")
            HStack
            {
                Button(action: {
                    postB = true
                    picturesB = false
                    allB = false
                }, label: {
                    Text("Post")
                })
                .background(postB ? .blue : Color(red: 240/255, green: 240/255, blue: 240/255))
                
                Button(action: {
                    postB = false
                    picturesB = true
                    allB = false
                }, label: {
                    Text("Pictures")
                })
                .background(picturesB ? .blue : Color(red: 240/255, green: 240/255, blue: 240/255))
                
                Button(action: {
                    postB = false
                    picturesB = false
                    allB = true
                }, label: {
                    Text("All")
                })
                .background(allB ? .blue : Color(red: 240/255, green: 240/255, blue: 240/255))
            }
//            ScrollView
//            {
//                VStack(spacing:30)
//                {
//                    ForEach(posts, id: \.self) { post in
//                        postView(post: post, dark: self.dark)
//                    }
//                    .background(dark ? .black : .white)
//                }
//                .frame(width: 400)
//                .border(Color.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
//            }
        }
    }
}

#Preview {
    accountPage()
}
