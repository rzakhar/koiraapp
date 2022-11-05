//
//  AppointmentView.swift
//  KoiraApp
//
//  Created by Roman Zakharov on 4.11.2022.
//

import SwiftUI

struct AppointmentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to the Dog world").font(.headline)
                MediumTile(title: "Dogs at Therapy?", imageName: "DogTherapy")
                HStack {
                    MediumTile(title: "For future pet owners", imageName: "FuturePetOwners")
                    MediumTile(title: "Book Time", imageName: "PawCalendar")
                }
                HStack {
                    MediumTile(title: "Our shelters", imageName: "DogHome")
                    MediumTile(title: "Find the Dog for You", imageName: "PhoneHand")
                }
            }
            .padding(.horizontal, 20)
            .navigationTitle("KoiraApp")
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(
                Color.accentColor,
                for: .navigationBar)
            
        }
    }
}

struct AppointmentView_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentView()
    }
}
