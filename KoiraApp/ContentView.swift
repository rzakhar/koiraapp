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
                    Image(systemName: "calendar.badge.plus")
                    Text("Appointment")
                }

            SheltersView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Shelters")
                }

            InfoView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Info")
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
