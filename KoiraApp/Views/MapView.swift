//
//  SheltersView.swift
//  KoiraApp
//
//  Created by Roman Zakharov on 4.11.2022.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 60.192059, longitude: 24.945831),
        span: MKCoordinateSpan(latitudeDelta: 0.25, longitudeDelta: 0.25))

    @StateObject var shelterModel = ShelterModel()

    var body: some View {
        NavigationView {
            Map(coordinateRegion: $coordinateRegion, annotationItems: shelterModel.shelters, annotationContent: { item in
                MapAnnotation(coordinate: item.location) {
                    MapAnnotationView(shelter: item)
                }
            })
            .task {
                await self.shelterModel.reload()
            }
            .navigationTitle("Shelters & Dog Owners")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SheltersView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
