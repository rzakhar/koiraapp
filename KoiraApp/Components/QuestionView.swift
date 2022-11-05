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
        VStack(alignment: .center) {
            Image(systemName: "questionmark")

            HStack(alignment: .top) {
                Text(question.question)
                Spacer()
            }
            .font(.title2)

            Image(systemName: "checkmark")
            
            HStack(alignment: .top) {
                Text(question.answer)
                Spacer()
            }
            .font(.title2)

            Divider()
        }
    }
}


