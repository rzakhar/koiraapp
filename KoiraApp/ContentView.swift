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
            MapView()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Map")
                }

            InfoView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Info")
                }

            AppointmentView()
                .tabItem {
                    Image(systemName: "calendar.badge.plus")
                    Text("Appointment")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
