//
//  DogModel.swift
//  KoiraApp
//
//  Created by Roman Zakharov on 5.11.2022.
//

import Foundation

@MainActor
class DogModel: ObservableObject {
    @Published var dogs: [Dog] = []
    var safeDogs: [Dog] = Bundle.main.decode("dogs.json")

    func reload() async {
        let url = URL(string: backendURL + "dogs")!
        let urlSession = URLSession.shared

        do {
            let (data, _) = try await urlSession.data(from: url)
            self.dogs = try JSONDecoder().decode([Dog].self, from: data)
        } catch {
            // Error handling in case the data couldn't be loaded
            // For now, only display the error on the console
            debugPrint("Error loading \(url): \(String(describing: error))")
            self.dogs = self.safeDogs
        }
    }
}

struct Dog: Codable, Identifiable {
    var id: String
    var name: String
    var species: String?
    var birthdate: String?
    var sex: String?
    var description: String?
    var shelter_id: String
    var images: [BlurHashedImageModel]
}
