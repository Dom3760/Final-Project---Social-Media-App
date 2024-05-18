//
//  commentView.swift
//  Social Media App
//
//  Created by StudentAM on 5/17/24.
//

import SwiftUI

struct commentView: View {
    var post: [Post] // Change to @Binding if passed from a parent view
    @Binding var postData: [postData]
    var accountIn: String
    
    var body: some View {
        VStack {
            if let index = post.firstIndex(where: { $0.username == accountIn }) {
                HStack {
                    Image(systemName: "person.crop.circle")
                    Text(post[index].username)
                }
                Text(post[index].body)
            }
            if let index = postData.firstIndex(where: { $0.username == accountIn }) {
                VStack(spacing: 20) {
                    ForEach(postData[index].comments, id: \.self) { data in
                        Text(data)
                    }
                }
            }
        }
    }
}

#Preview {
    commentView(post: [], postData: .constant([]), accountIn: "hello")
}
