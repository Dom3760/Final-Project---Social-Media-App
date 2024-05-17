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
    @Binding var postArray: [Post]
    @State var acc: String
    
    @State private var pushed = false
    
    @Environment(\.presentationMode) var presentationMode

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
                Button(action: addPost, label: {
                    Text("Add post")
                        .padding()
                        .frame(width: 300)
                        .background(Color.blue)
                        .foregroundColor(.black)
                        .cornerRadius(3.0)
                })
//                NavigationLink(destination: ContentView(accountIn:""), isActive: $pushed)
//                {
//                    EmptyView()
//                }
            }
        }
    }
    func addPost()
    {
        let newPost = Post(username: acc, title: title1, body: body1)
        print(postArray)
        postArray.append(newPost)
        print(postArray)
        presentationMode.wrappedValue.dismiss()
//        pushed = true
    }
}

#Preview {
    newPostView(postArray: .constant([]), acc: "")
}
