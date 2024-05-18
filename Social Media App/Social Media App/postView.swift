//
//  newPostView.swift
//  Social Media App
//
//  Created by StudentAM on 4/25/24.
//

import SwiftUI

struct postView: View {
    @State var post: Post
    @State var accInfo2: accInfo
    @State var accountIn : String
    @State var postData: [postData]
    
    @State var dark: Bool
    @State var liked = false

    var body: some View {
            VStack(alignment: .leading)
            {
                HStack
                {
                    Image(systemName: "person")
                        .font(.system(size: 25))
//                    if let index = accInfo1.firstIndex(where: { $0.username == accountIn})
                    NavigationLink(destination: accountPage(accInfo1: [accInfo2] , accountIn: post.username, posts: [post], dark: true)) {
                        Text(post.username)
                    }
                }
                Text(post.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                Text(post.body)
                HStack
                {
                    Button(action: {
                        liked.toggle()
                    }, label: {
                    Image(systemName: liked ? "heart.fill" : "heart")
                    })
                    NavigationLink(destination: commentView(post: [post], postData: $postData, accountIn: accountIn)) {
                        Image(systemName: "bubble.left")
                    }
                    NavigationLink(destination: shareView()){
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
            .foregroundColor(dark ? .white : .black)
            .padding()
            .frame(minHeight: 150 , maxHeight: 400)
            .frame(width: 350)
            .background(dark ? .black : .white)
            .cornerRadius(10.0)
            .shadow(radius: 5)
//            .border(Color.black)
    }
}

#Preview {
    postView(post: Post(username: "example", title: "there are rats", body: "there are rats in the ceiling"), accInfo2: accInfo(username: "example", bio: "bio", pronouns: "pronouns", stateCountry: "state/country"), accountIn: "example", postData: [], dark: false)
}
