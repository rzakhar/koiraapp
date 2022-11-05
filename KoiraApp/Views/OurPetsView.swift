//
//  OurPetsView.swift
//  KoiraApp
//
//  Created by Roman Zakharov on 4.11.2022.
//

import SwiftUI

struct OurPetsView: View {
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
            .navigationTitle("Our pets")
            .padding(.horizontal, 20)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(
                Color.accentColor,
                for: .navigationBar)
        }
        .task {
            await self.dogModel.reload()
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        OurPetsView()
    }
}
