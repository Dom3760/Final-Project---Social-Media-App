//
//  ContentView.swift
//  Social Media App
//
//  Created by StudentAM on 4/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView
        {
            VStack
            {
                HStack
                {
                    Image(systemName: "list.bullet")
                        .font(.system(size: 25))
                    Spacer()
                        .frame(width: 250, height: 1)
                    NavigationLink(destination: accountPage()){
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 25))
                            .padding()
                    }
                    .foregroundColor(.black)
                    
                       
                    
                }
                .frame(width: 400, height: 45, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
                .position(x: 200.0, y: -20)
                List
                {
                    VStack
                    {
                        Text("hello")
                            .font(.title)

                        Text("lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum")
                    }
                    VStack
                    {
                        Text("hello")
                            .font(.title)
                        Text("lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum")
                    }
                    VStack
                    {
                        Text("hello")
                            .font(.title)
                        Text("lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum")
                    }
                }
                .padding(.top)
                .frame(width: 400, height: 700, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                HStack
                {
                    Image(systemName: "house")
                        .font(.system(size: 25))
                        .frame(width: 120, height:50)
                    Image(systemName: "plus")
                        .font(.system(size: 25))
                        .frame(width: 120, height:50)
                    Image(systemName: "gear")
                        .font(.system(size: 25))
                        .frame(width: 120, height:50)
                }
                .frame(width: 400, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                //            .position(x: 200, y:384)
            }
        }
    }
}

#Preview {
    ContentView()
}
