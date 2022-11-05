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
        ZStack(alignment: .bottom) {
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

                    HStack {
                        if let sex = dog.sex {
                            Text(sex.capitalized)
                        }

                        Image(systemName: "pawprint")
                            .foregroundColor(.accentColor)

                        if let species = dog.species {
                            Text(species)
                        }
                    }
                    .font(.title2)
                    .padding(.top, 20)

                    if let birthdate = dog.birthdate {
                        Text("Born " + birthdate)
                    }

                    if let description = dog.description {
                        Text(description)
                            .padding()
                            .padding(.bottom, 70)
                    }

                }
            }

            Button {
                print("!23")
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 300)
                        .foregroundColor(.accentColor)
                    HStack {
                        Image(systemName: "calendar.badge.plus")
                            .foregroundColor(.white)
                        Text("Pay a visit")
                            .foregroundColor(.white)
                    }
                }
            }
            .frame(height: 50)
            .padding(.horizontal, 40)
            .padding(.bottom, 10)
        }
    }
}

struct DogInfoView_Previews: PreviewProvider {
    static var previews: some View {
        DogInfoView(dog: DogModel().safeDogs.first!)
    }
}
