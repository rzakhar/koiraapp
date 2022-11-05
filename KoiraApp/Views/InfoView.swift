//
//  InfoView.swift
//  KoiraApp
//
//  Created by Roman Zakharov on 4.11.2022.
//

import SwiftUI

struct InfoView: View {
    @StateObject var dogModel = DogModel()

    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(dogModel.dogs) { dog in
                        DogItemView(dog: dog)
                    }
                }
            }
            .navigationTitle("Information")
            .padding(.horizontal, 20)
        }
        .task {
            await self.dogModel.reload()
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
