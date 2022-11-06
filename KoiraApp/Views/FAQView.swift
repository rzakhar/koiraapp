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
                if let url = URL(string: googleURL) {
                    Link (destination: url) {
                        Image(systemName: "arkit")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                        Text("See different dogs in the AR")
                            .font(.title2)
                    }
                    .padding()
                }
                ForEach(questionModel.questions) { question in
                    QuestionView(question: question)
                }
            }
            .frame(maxWidth: 600)
            .navigationTitle("FAQ")
            .navigationViewStyle(StackNavigationViewStyle())
            .padding(.horizontal, 20)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(
                Color("NavBarColor"),
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
