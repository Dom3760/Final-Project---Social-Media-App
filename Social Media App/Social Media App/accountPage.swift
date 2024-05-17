//
//  accountPage.swift
//  Social Media App
//
//  Created by StudentAM on 4/23/24.
//

import SwiftUI

struct accountPage: View {
    var accInfo1: [accInfo]
    var accountIn: String
    var posts: [Post]
    @State var dark: Bool
    
    @State private var postB = true
    @State private var picturesB = false
    @State private var allB = false
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Circle()
                        .frame(width: 100, height: 100)
                    // Display profile picture here
                }
                if let index = accInfo1.firstIndex(where: { $0.username == accountIn }) {
                    Text(accInfo1[index].username)
                }
            }
            
            VStack
            {
                if let index = accInfo1.firstIndex(where: { $0.username == accountIn }) {
                    HStack {
                        
                        Text(accInfo1[index].pronouns)
                        Text(accInfo1[index].stateCountry)
                        
                    }
                    Text("Bio: \(accInfo1[index].bio)")
                }
            }
            
            HStack {
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
            
            ScrollView {
                VStack(spacing: 30)
                {
                    ForEach(posts.indices, id: \.self) { i in
                        if posts[i].username == accountIn
                        {
                            postView(post: posts[i], dark: dark)
//                                .background(self.dark ? Color.black : Color.white)
                            }
                        }
                    }
                }
            }
        }
}

#Preview {
    accountPage(accInfo1: [],accountIn: "", posts: [], dark: true)
}



//                VStack(spacing: 30) {
//                    ForEach(posts, id: \.self) { post in
//                        postView(post: post, dark: self.dark)
//                            .background(self.dark ? Color.black : Color.white)
//                    }
//                }
//                .frame(width: 400) // Adjust width as needed
//                .border(Color.black) // Add border if necessary

//                if let index = posts.firstIndex(where: $0.username == accountIn)
//                {
//
//                }
