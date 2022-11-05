//
//  DogInfoView.swift
//  KoiraApp
//
//  Created by Roman Zakharov on 5.11.2022.
//

import SwiftUI

struct DogInfoView: View {
    var dog: Dog
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ScrollView(.horizontal) {
                    List(dog.images, id: \.self) { image in
                        AsyncImage(url: URL(string: backendURL + image)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .clipped()
                        } placeholder: {
                            Color.gray
                        }
                        .frame(height: 200, alignment: .center)
                        .cornerRadius(16)
                    }
                }
            }
            Text(dog.name)
                .font(.largeTitle)
        }
    }
}

struct DogInfoView_Previews: PreviewProvider {
    static var previews: some View {
        DogInfoView(dog: DogModel().safeDogs.first!)
    }
}
