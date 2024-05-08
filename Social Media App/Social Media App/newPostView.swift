//
//  newPostView.swift
//  Social Media App
//
//  Created by StudentAM on 4/25/24.
//

import SwiftUI

struct newPostView: View {
    @State var title1: String = ""
    @State var body1: String = ""
    @State var postArray: [Post]

    var body: some View {
        NavigationView()
        {
            VStack
            {
                ZStack {
                    Rectangle()
                    // fills with a color, gives a color
                        .fill(Color(red: 240/255, green: 240/255, blue: 240/255))
                        .frame(height: 80)
                    // makes a text field that will store the title when add item is clicked.
                    TextField("Title", text: $title1)
                    // rounded text box style and padding
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
                ZStack
                {
                    Rectangle()
                        .fill(Color(red: 240/255, green: 240/255, blue: 240/255))
                    TextEditor(text: $body1)
                        .frame(/*width: 350,*/ height: 400)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
                NavigationLink(destination: ContentView()) {
                    Text("Add post")
                        .padding()
                        .frame(width: 300)
                        .background(Color.blue)
                        .foregroundColor(.black)
                        .cornerRadius(3.0)
                }
                .onTapGesture {
                    let newPost = Post(username: "", title: title1, body: body1)
                    postArray.append(newPost)
                }
            }
        }
    }
}

#Preview {
    newPostView(postArray: [])
}
