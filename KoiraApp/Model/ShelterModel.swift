//
//  LocationModel.swift
//  KoiraApp
//
//  Created by Roman Zakharov on 4.11.2022.
//

import MapKit

@MainActor
class ShelterModel: ObservableObject {
    @Published var shelters: [Shelter] = []
    var safeShelters : [Shelter] = Bundle.main.decode("shelters.json")
    
    func reload() async {
        let url = URL(string: backendURL + "shelters")!
        let urlSession = URLSession.shared

        do {
            let (data, _) = try await urlSession.data(from: url)
            self.shelters = try JSONDecoder().decode([Shelter].self, from: data)
        } catch {
            // Error handling in case the data couldn't be loaded
            // For now, only display the error on the console
            debugPrint("Error loading \(url): \(String(describing: error))")
            self.shelters = self.safeShelters
        }
    }
}

struct Shelter: Codable, Identifiable {
    var id: String
    var name: String
    var address: String?
    var icon: String
    var image_url: String?
    var latitude: Double
    var longitude: Double
    var phone: String?
    var url: String?

    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
