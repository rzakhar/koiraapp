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
                Spacer()
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
        }
    }
}

struct AppointmentView_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentView()
    }
}
