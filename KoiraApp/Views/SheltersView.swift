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
        span: MKCoordinateSpan(latitudeDelta: 0.25, longitudeDelta: 0.25))

    @StateObject var locationModel = LocationModel()

    var body: some View {
        NavigationView {
            Map(coordinateRegion: $coordinateRegion, annotationItems: locationModel.shelters, annotationContent: { item in
                MapAnnotation(coordinate: item.location) {
                    MapAnnotationView(location: item)
                }
            })
            .task {
                await self.locationModel.reload()
            }
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
