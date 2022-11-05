//
//  QuestionModel.swift
//  KoiraApp
//
//  Created by Roman Zakharov on 5.11.2022.
//

import MapKit

@MainActor
class QuestionModel: ObservableObject {
    @Published var questions: [Question] = []
    var safeShelters: [Question] = Bundle.main.decode("questions.json")

    func reload() async {
        let url = URL(string: backendURL + "questions")!
        let urlSession = URLSession.shared

        do {
            let (data, _) = try await urlSession.data(from: url)
            self.questions = try JSONDecoder().decode([Question].self, from: data)
        } catch {
            // Error handling in case the data couldn't be loaded
            // For now, only display the error on the console
            debugPrint("Error loading \(url): \(String(describing: error))")
            self.questions = self.safeShelters
        }
    }
}

struct Question: Codable, Identifiable {
    var id: String
    var question: String
    var answer: String
}
