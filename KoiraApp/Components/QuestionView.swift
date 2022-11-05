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
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .padding(.top, 20)
                .foregroundColor(.accentColor)

            Text(question.question)
                .multilineTextAlignment(.center)
                .font(.title2)
                .fontWeight(.bold)

            Image(systemName: "checkmark")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(.green)

            HStack(alignment: .top) {
                Text(question.answer)
                Spacer()
            }
            .font(.title2)

            Divider()
        }
    }
}


