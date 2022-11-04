//
//  SheltersView.swift
//  KoiraApp
//
//  Created by Roman Zakharov on 4.11.2022.
//

import SwiftUI
import MapKit

struct SheltersView: View {
    @State var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 60.192059, longitude: 24.945831),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))

    var body: some View {
        NavigationView {
            Map(coordinateRegion: $coordinateRegion)
                .navigationTitle("Shelters")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SheltersView_Previews: PreviewProvider {
    static var previews: some View {
        SheltersView()
    }
}
