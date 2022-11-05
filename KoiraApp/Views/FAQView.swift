//
//  ProfileView.swift
//  KoiraApp
//
//  Created by Roman Zakharov on 4.11.2022.
//

import SwiftUI

struct FAQView: View {
    @StateObject var questionModel = QuestionModel()

    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                    ForEach(questionModel.questions) { question in
                        QuestionView(question: question)
                    }
            }
            .navigationTitle("FAQ")
            .padding(.horizontal, 20)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(
                Color.accentColor,
                for: .navigationBar)
        }
        .task {
            await self.questionModel.reload()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        FAQView()
    }
}
