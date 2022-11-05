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
            .frame(maxWidth: 600)
            .navigationTitle("Our pets")
            .navigationViewStyle(StackNavigationViewStyle())
            .padding(.horizontal, 20)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(
                Color("NavBarColor"),
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
