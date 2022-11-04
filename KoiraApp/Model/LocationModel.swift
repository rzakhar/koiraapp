//
//  LocationModel.swift
//  KoiraApp
//
//  Created by Roman Zakharov on 4.11.2022.
//

import MapKit

@MainActor
class LocationModel: ObservableObject {
    @Published var shelters: [Location] = []

    func reload() async {
        let url = URL(string: "http://10.84.113.129/test.json")!
        let urlSession = URLSession.shared

        do {
            let (data, _) = try await urlSession.data(from: url)
            self.shelters = try JSONDecoder().decode([Location].self, from: data)
        } catch {
            // Error handling in case the data couldn't be loaded
            // For now, only display the error on the console
            debugPrint("Error loading \(url): \(String(describing: error))")
        }
    }
}

struct Location: Codable, Identifiable {
    var id: String
    var name: String
    var address: String
    var image: String
    var latitude: Double
    var longitude: Double
    var phone: String
    var url: String

    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
