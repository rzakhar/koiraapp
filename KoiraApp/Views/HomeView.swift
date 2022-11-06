//
//  AppointmentView.swift
//  KoiraApp
//
//  Created by Roman Zakharov on 4.11.2022.
//

import SwiftUI

struct HomeView: View {
    @Binding var tabSelection: Int

    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                Text("Welcome to the Dog world")
                    .font(.title3)
                    .padding()

                MediumTile(title: "Dogs at Therapy?", imageName: "DogTherapy")
                    .onTapGesture {
                        tabSelection = 4
                    }
                HStack {
                    MediumTile(title: "For future pet owners", imageName: "FuturePetOwners")
                        .onTapGesture {
                            tabSelection = 4
                        }
                    MediumTile(title: "Book Time", imageName: "PawCalendar")
                        .onTapGesture {
                            tabSelection = 2
                        }
                }
                HStack {
                    MediumTile(title: "Our shelters", imageName: "DogHome")
                        .onTapGesture {
                            tabSelection = 2
                        }
                    MediumTile(title: "Find the Dog for You", imageName: "PhoneHand")
                        .onTapGesture {
                            tabSelection = 3
                        }
                }
            }
            .frame(maxWidth: 600)
            .padding(.horizontal, 20)
            .navigationTitle("KoiraApp")
            .navigationViewStyle(StackNavigationViewStyle())
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(
                Color("NavBarColor"),
                for: .navigationBar)
        }
    }
}

