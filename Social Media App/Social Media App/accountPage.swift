//
//  accountPage.swift
//  Social Media App
//
//  Created by StudentAM on 4/23/24.
//

import SwiftUI

struct accountPage: View {
   
    @State var accInfo1 : [accInfo]
    
    @State var postB = true
    @State var picturesB = false
    @State var allB = false
    @State var index = 0
    
    @State var accountIn: String
    @State var posts:[Post]
    @State var dark: Bool
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Circle()
                        .frame(width: 100, height: 100)
        //            Image("")
                }
                Text(accInfo1[index].username)
            }
            HStack
            {
                Text(accInfo1[index].pronouns)
                Text(accInfo1[index].stateCountry)
            }
            Text("bio: \(accInfo1[index].bio)")
            HStack
            {
                Button(action: {
                    postB = true
                    picturesB = false
                    allB = false
                }, label: {
                    Text("Post")
                })
                .frame(width: UIScreen.main.bounds.width * 0.33)
                .background(postB ? .blue : Color(red: 240/255, green: 240/255, blue: 240/255))
                .foregroundColor(postB ? .white : .black)
                
                Button(action: {
                    postB = false
                    picturesB = true
                    allB = false
                }, label: {
                    Text("Pictures")
                })
                .frame(width: UIScreen.main.bounds.width * 0.33)
                .background(picturesB ? .blue : Color(red: 240/255, green: 240/255, blue: 240/255))
                .foregroundColor(picturesB ? .white : .black)
                
                Button(action: {
                    postB = false
                    picturesB = false
                    allB = true
                }, label: {
                    Text("All")
                })
                .frame(width: UIScreen.main.bounds.width * 0.33)
                .background(allB ? .blue : Color(red: 240/255, green: 240/255, blue: 240/255))
                .foregroundColor(allB ? .white : .black)
            }
            ScrollView
            {
                VStack(spacing:30)
                {
                    ForEach(posts, id: \.self) { post in
                        postView(post: post, dark: self.dark)
                    }
                    .background(dark ? .black : .white)
                }
                .frame(width: 400)
                .border(Color.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    accountPage(accInfo1: [],accountIn: "", posts: [], dark: false)
}
