//
//  newPostView.swift
//  Social Media App
//
//  Created by StudentAM on 4/25/24.
//

import SwiftUI

struct postView: View {
    @State var post: Post
    @State var dark: Bool

    var body: some View {
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
                    .padding(.bottom, 5)
                Text(post.body)
            }
            .foregroundColor(dark ? .white : .black)
            .padding()
            .frame(minHeight: 150 , maxHeight: 300)
            .frame(width: 350)
            .background(dark ? .black : .white)
            .cornerRadius(10.0)
            .shadow(radius: 5)
//            .border(Color.black)
    }
}

#Preview {
    postView(post: Post(username: "example", title: "there are rats", body: "there are rats in the celing"), dark: false)
}
