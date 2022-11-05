//
//  ContentView.swift
//  KoiraApp
//
//  Created by Roman Zakharov on 4.11.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AppointmentView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            MapView()
                .tabItem {
                    Image(systemName: "calendar.badge.plus")
                    Text("Find shelter")
                }

            InfoView()
                .tabItem {
                    Image(systemName: "pawprint.fill")
                    Text("Our Pets")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("My Profile")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
