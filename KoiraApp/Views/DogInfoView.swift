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
                VStack {
                    Text(dog.name)
                        .font(.largeTitle)
                        .padding(.top, 35)
                }

                TabView {
                    ForEach(dog.images) { image in
                        AsyncImage(url: URL(string: backendURL + image.url)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .clipped()
                        } placeholder: {
                            Color.gray
                        }
                        .frame(height: 200, alignment: .center)
                        .cornerRadius(16)
                        .padding()
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(height: 200)


                if let birthdate = dog.birthdate {
                    Text(birthdate)
                }

                HStack {
                    if let sex = dog.sex {
                        Text(sex.capitalized)
                    }

                    if let species = dog.species {
                        Text(species)
                    }
                }

                Image(systemName: "pawprint")
                    .resizable()
                    .foregroundColor(.accentColor)
                    .scaledToFit()
                    .frame(width: 80, height: 80)

                if let description = dog.description {
                    Text(description)
                        .padding()
                }
            }
        }
    }
}

struct DogInfoView_Previews: PreviewProvider {
    static var previews: some View {
        DogInfoView(dog: DogModel().safeDogs.first!)
    }
}
