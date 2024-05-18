//
//  ContentView.swift
//  Social Media App
//
//  Created by StudentAM on 4/23/24.
//

import SwiftUI

struct Users: Hashable {
    var email: String
    var username: String
    var password: String
    var phonenum: String
    var name: String
//    var posts: [post]
}
struct Post: Hashable {
    var username: String
//    var pic: Image
    var title: String
    var body: String
}

struct postData: Hashable {
    var username: String
    var likesCount: Int
    var comments: [String]
    var shareCount: Int
}

struct accInfo{
    var username: String
    var bio: String
    var pronouns: String
    var stateCountry: String
}

struct ContentView: View {
    
    @State private var shown = false
    @State private var dark = false
    @State private var signedIn = false
    @State var accountIn: String = ""
    
    @State private var userData: [Users] = [
        Users(email: "DanielCarson@gmail.com", username: "DanielC408", password: "DanSecure320!", phonenum: "408-838-7828", name: "Daniel"),
        Users(email: "BO3Boss@gmail.com", username: "Bo4Gamer67", password: "CodIsLife3989", phonenum: "408-738-8939", name: "Josh"),
        Users(email: "StringCheese@gmail.com", username: "FoodGoblin", password: "CheeseBurger4353", phonenum: "408-393-7383", name: "Bob"),
        Users(email: "blueCheese@gmail.com", username: "BlueCheese830", password: "1234", phonenum: "408-829-3893", name: "Fred")
    ]
    
    @State private var posts: [Post] = [
        Post(username: "DanielC408", title: "You won't believe who I saw!", body: "Today I went to walmart and I saw Travis Scott in the store. He was shopping for stuff. I went to say hi, and he said hi back. Crazy stuff I know!"),
        Post(username: "Bo4Gamer67", title: "COD!", body: "I love Cod so much. Specifically BO4. The new warzone is bad compared to the old cod games. Do You guys agree?"),
        Post(username: "FoodGoblin", title: "Cheese!", body: "I just found out that there are a bunch of different types of string cheese. For some reason I didnt notice that they have other cheeses than mozzarella. Ashamed, I used to call myself a cheese enthusiast."),
        Post(username: "BlueCheese830", title: "I can eat Blue Cheese anywhere", body: "I can eat blue cheese with anyone, on anything. anywhere. It is the best thing ever, I swear.")
    ]
    
    @State private var postData1: [postData] = [
        postData(username: "DanielC408", likesCount: 32678, comments: ["bro that is so sick I love his music", "is that the guy from fortnite?!"], shareCount: 16328),
        postData(username: "Bo4Gamer67", likesCount: 45678, comments: ["I love COD!","I think BO1 is better, but cod in general is amazing"], shareCount: 30786),
        postData(username: "FoodGoblin", likesCount: 15836, comments: ["in my opinion string cheese is okay lol.", "That is cool I was today years old lol"], shareCount: 5342),
        postData(username: "BlueCheese830", likesCount: 200, comments: ["I don' really like blue cheese","That's so cool I love it too lol"] , shareCount: 10)
    ]
    
    @State private var accInfo1: [accInfo] = [
        accInfo(username: "DanielC408", bio: "whats up? I am Daniel Carson. I love listening to music.", pronouns: "He/Him", stateCountry: "CA/USA"),
        accInfo(username: "Bo4Gamer67", bio: "I love COD in general, but my favorite is BO4!", pronouns: "He/Him", stateCountry: "CA/USA"),
        accInfo(username: "FoodGoblin", bio: "I am a Self-proclaimed food enthusist", pronouns: "String/Cheese", stateCountry: "CA/USA"),
        accInfo(username: "BlueCheese830", bio: "I am in love with blue cheese. I would litterly marry it", pronouns: "He/Him", stateCountry: "CA/USA")
    ]
    
    var body: some View {
        TabView
        {
        NavigationView
            {
                ZStack {
                    VStack
                    {
                        HStack
                        {
                            Button(action: menu, label: {
                                Image(systemName: "list.bullet")
                                    .foregroundColor(dark ? .white : .black)
                                    .font(.system(size: 25))
                                    .foregroundColor(.black)
                            })
                            Spacer()
                                .frame(width: 250, height: 1)
                            NavigationLink(destination: signedIn ? AnyView(accountPage(accInfo1: accInfo1, accountIn: accountIn, posts: posts, dark: dark)) : AnyView(signInPage(signedIn: $signedIn, post2: posts, accountIn: $accountIn, accounts: userData))) {
                                Image(systemName: "person.crop.circle")
                                    .font(.system(size: 25))
//                                    .frame(width: 120, height:50)
                            }
                            .foregroundColor(dark ? .white : .black)
                        }
//                        .ignoresSafeArea()
//                        .position(x: 225, y: 25.0)
                        
                        ScrollView
                        {
                            VStack(spacing:30)
                            {
                                ForEach($posts, id: \.self) { post in
                                    ForEach($posts, id: \.self) { post in
                                        if let index = accInfo1.firstIndex(where: { $0.username == post.username.wrappedValue }) {
                                                    let accInfoForPost = accInfo1[index]
                                                    // Call your postView here, passing in post, accInfoForPost, and any other necessary parameters
                                            postView(post: post.wrappedValue, accInfo2: accInfoForPost, accountIn: accountIn, postData: postData1, dark: dark)
                                                        .background(dark ? Color.black : Color.white)
                                        }
                                    }
                                }
                                .background(dark ? .black : .white)
                            }
                            .frame(width: 400)
                            .border(Color.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        }
                        .border(Color.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        .foregroundColor(dark ? .white : .black)
//                        .padding(.top, 100)
//                        .frame(height: 650)
                        HStack
                        {
                            NavigationLink (destination: ContentView(),label: {
                                Image(systemName: "house")
                                    .foregroundColor(dark ? .white : .black)
                                    .font(.system(size: 25))
                                    .frame(width: 120, height:50)
                            })
                            .foregroundColor(.black)
                            NavigationLink(destination: signedIn ? AnyView(newPostView(postArray: $posts, acc: accountIn)) : AnyView(signInPage(signedIn: $signedIn, post2: posts, accountIn: $accountIn, accounts: userData))) {
                                Image(systemName: "plus")
                                    .foregroundColor(dark ? .white : .black)
                                    .font(.system(size: 25))
                                    .frame(width: 120, height:50)
                            }
                            .foregroundColor(.black)
                            NavigationLink(destination: signedIn ? AnyView(settingsPage(userData: $userData, accInfo1: $accInfo1, accountIn: accountIn)) : AnyView(signInPage(signedIn: $signedIn, post2: posts, accountIn: $accountIn, accounts: userData))) {
                                Image(systemName: "gear")
                                    .font(.system(size: 25))
                                    .frame(width: 120, height:50)
                            }
                        }
                        .foregroundColor(dark ? .white : .black)
                        .frame(width: 400, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                        .border(.black)
//                        .ignoresSafeArea()
//                        .position(x: 200, y: 25)
                    }
                    if shown
                    {
                        Rectangle()
                            .foregroundColor(dark ? .black : .white)
                            .opacity(1)
                            .edgesIgnoringSafeArea(.all)
                        VStack
                        {
                            HStack {
                                Button(action: menu, label: {
                                    Image(systemName: "list.bullet")
                                        .font(.system(size: 25))
                                        .foregroundColor(dark ? .white : .black)
                                })
//                                .padding()
                                .position(x: 45)
                            }
                            VStack(alignment: .leading) {
                                NavigationLink (destination: ContentView(),label: {
                                    HStack {
                                        Text("Home")
                                        Image(systemName: "house")
                                    }
                                    .foregroundColor(dark ? .white : .black)
                                    .font(.system(size: 25))
                                    .fontWeight(.bold)
                                })
                                .padding()
                                NavigationLink(destination: signedIn ? AnyView(settingsPage(userData: $userData, accInfo1: $accInfo1, accountIn: accountIn)) : AnyView(signInPage(signedIn: $signedIn, post2: posts, accountIn: $accountIn, accounts: userData))) {
                                    HStack {
                                        Text("Settings")
                                        Image(systemName: "gear")
                                    }
                                    .foregroundColor(dark ? .white : .black)
                                    .font(.system(size: 25))
                                    
                                }
                                .padding()
                                NavigationLink(destination: AnyView(signInPage(signedIn: $signedIn, post2: posts, accountIn: $accountIn, accounts: userData))) {
                                    Text("Sign In")
                                }
                                .padding()
                                .foregroundColor(dark ? .white : .black)
                                .font(.system(size: 25))
                                NavigationLink(destination: signUpPage(accInfo: $userData)) {
                                    Text("Sign Up")
                                }
                                .padding()
                                .foregroundColor(dark ? .white : .black)
                                .font(.system(size: 25))
                                
                            }
                            .frame(width: 400)
                            Spacer()
                                .frame(width: 100, height: 300)
                            HStack
                            {
                                NavigationLink(destination: signedIn ? AnyView(accountPage(accInfo1: accInfo1, accountIn: accountIn, posts: posts, dark: dark)) : AnyView(signInPage(signedIn: $signedIn, post2: posts, accountIn: $accountIn, accounts: userData))) {        HStack {
                                        if signedIn {
                                            Text(accountIn)
                                        }
                                        else{
                                            Text("Sign In")
                                        }
                                        Image(systemName: "person.crop.circle")
                                    }
                                    .font(.system(size: 25))
//                                    .padding()
                                }
                                Toggle("Dark Mode:", isOn: $dark)
                                    .foregroundColor(dark ? .white : .black)
                                    .padding()
                                    .frame(width:200)
                                    .font(.system(size: 20))
                            }
                            .foregroundColor(dark ? .white : .black)
                        }
                    }
                }
                .background(dark ? .black: .white)
            }
        }
    }
    
    
    func menu ()
    {
        if shown == false
        {
            shown = true
        }
        else
        {
            shown = false
        }
    }
}

#Preview {
    ContentView()
}
