//
//  ContentView.swift
//  InstagramClone
//
//  Created by Shashikant's_Macmini on 14/07/20.
//  Copyright © 2020 redbytes. All rights reserved.
//

//https://www.youtube.com/watch?v=cuVrKWnR608&list=PLimqJDzPI-H_133AHEpgB2vEbX0N5QH7G


import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                Home()
                    .navigationBarTitle("Instagram")
                    .navigationBarItems(leading: Button(action: {
                        
                    }, label: {
                        Image("cam")
                            .resizable()
                            .frame(width: 30, height: 30)
                    })
                        .foregroundColor(Color("darkAndWhite"))
                        ,trailing:
                        HStack {
                            Button(action: {
                                
                            }) {
                                Image("IGTV")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                            }.foregroundColor(Color("darkAndWhite"))
                            Button(action: {
                                
                            }) {
                                Image("send")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                            }.foregroundColor(Color("darkAndWhite"))
                        }
                )
            }.tabItem {
                Image("home")
            }
            
            Text("Find").tabItem {
                Image("find")
            }
            Text("Upload").tabItem {
                Image("plus")
            }
            Text("Likes").tabItem {
                Image("heart")
            }
            Text("Profile").tabItem {
                Image("people")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
