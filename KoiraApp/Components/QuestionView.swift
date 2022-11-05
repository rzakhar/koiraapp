//
//  QuestionView.swift
//  KoiraApp
//
//  Created by Roman Zakharov on 5.11.2022.
//

import SwiftUI

struct QuestionView: View {
    var question: Question

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(systemName: "questionmark")
                Text(question.question)
                Spacer()
            }
            .font(.title2)

            HStack(alignment: .top) {
                Image(systemName: "checkmark")
                Text(question.answer)
                Spacer()
            }
            .font(.title2)

            Divider()
        }
    }
}


