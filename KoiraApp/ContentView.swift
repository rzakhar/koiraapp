//
//  ContentView.swift
//  KoiraApp
//
//  Created by Roman Zakharov on 4.11.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection = 1

    var body: some View {
        TabView(selection: $tabSelection) {
            AppointmentView(tabSelection: $tabSelection)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(1)
            
            MapView()
                .tabItem {
                    Image(systemName: "calendar.badge.plus")
                    Text("Find shelter")
                }
                .tag(2)

            InfoView()
                .tabItem {
                    Image(systemName: "pawprint.fill")
                    Text("Our Pets")
                }
                .tag(3)

            FAQView()
                .tabItem {
                    Image(systemName: "person.fill.questionmark")
                    Text("FAQ")
                }
                .tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
