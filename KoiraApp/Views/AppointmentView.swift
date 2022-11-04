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
                MediumTile(title: "Our shelters", imageName: "house")
                HStack {
                    MediumTile(title: "Our shelters", imageName: "house")
                    MediumTile(title: "Our shelters", imageName: "house")
                }
                HStack {
                    MediumTile(title: "Our shelters", imageName: "house")
                    MediumTile(title: "Our shelters", imageName: "house")
                }
            }
            .padding(.horizontal, 20)
            .navigationTitle("Appointment")
        }
    }
}

struct AppointmentView_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentView()
    }
}
