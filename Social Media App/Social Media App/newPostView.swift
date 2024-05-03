//
//  newPostView.swift
//  Social Media App
//
//  Created by StudentAM on 4/25/24.
//

import SwiftUI

struct newPostView: View {
    @State var Title1: String = ""
    @State var Body1: String = ""

    var body: some View {
        ZStack {
            Rectangle()
                // fills with a color, gives a color
                .fill(Color(red: 240/255, green: 240/255, blue: 240/255))
                .frame(height: 80)
            // makes a text field that will store the title when add item is clicked.
            TextField("Title", text: $Title1)
                // rounded text box style and padding
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
        // zstack that will put the large text box inside of the rectangle.
        ZStack{
            // makes a rectangle
            Rectangle()
                // fills with gray
                .fill(Color(red: 240/255, green: 240/255, blue: 240/255))
            // text that will be saved into the array when add item is pushed,
            TextEditor(text: $Body1)
                // adds a height, alignment, rounded style, and padding to the text box
                .frame(height: 500, alignment: .center)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

        }
    }
}

#Preview {
    newPostView()
}
