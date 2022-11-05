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
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(
                Color.accentColor,
                for: .navigationBar)
        }
    }
}

struct SheltersView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

final class LocationManager: NSObject, ObservableObject {
    @Published var location: CLLocation?
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 38.898150, longitude: -77.034340),
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )
    private var hasSetRegion = false

    private let locationManager = CLLocationManager()

    override init() {
        super.init()

        self.locationManager.delegate = self

        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            self.location = location

            if !hasSetRegion {
                self.region = MKCoordinateRegion(center: location.coordinate,
                                                 span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
                hasSetRegion = true
            }
        }
    }
}
