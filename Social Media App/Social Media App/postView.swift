//
//  newPostView.swift
//  Social Media App
//
//  Created by StudentAM on 4/25/24.
//

import SwiftUI

struct postView: View {
    @State var post: Post

    var body: some View {
//        @environmentObject()
//        @State var posts: [Post] = []
//        ForEach(posts, id: \.self){ post in
            VStack(alignment: .leading)
            {
                HStack
                {
                    Image(systemName: "person")
                        .font(.system(size: 25))
                    Text(post.username)
                }
                Text(post.title)
                    .fontWeight(.bold)
                Text(post.body)
            }
            .frame(width: 350, min-height: 150)
            .cornerRadius(3.0)
            .border(Color.black)
//        }
    }
}

#Preview {
    postView(post: Post(username: "example", title: "there are rats", body: "there are rats in the celing"))
}
