//
//  ShelterInfoView.swift
//  KoiraApp
//
//  Created by Roman Zakharov on 4.11.2022.
//

import SwiftUI
import UIKit

struct ShelterInfoView: View {
    @Environment(\.presentationMode) var presentationMode
    var shelter: Shelter

    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack {
                Spacer()

                Text(shelter.name)
                    .font(.largeTitle)
                    .padding(.vertical, 35)

                Spacer()
            }

            if let image = shelter.image {
                BlurhashedImage(image: image)
                    .frame(width: UIScreen.main.bounds.size.width, height: 300, alignment: .center)
                    .clipped()
            }

            VStack(alignment: .leading) {
                if let address = shelter.address {
                    ShelterInfoItemView(image: "map", text: address)
                }

                if let phone = shelter.phone {
                    ShelterInfoItemView(image: "phone", text: phone)
                }

                if let url = shelter.url {
                    ShelterInfoItemView(image: "link", text: url)
                }
            }
            .padding()

            LazyVStack {
                ForEach(shelter.dogs) { dog in
                    DogItemView(dog: dog)
                        .padding(.horizontal, 20)
                }
            }
        }
        .overlay(alignment: .topTrailing) {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                ZStack {
                    Circle()
                        .foregroundColor(.accentColor)
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                }
            })
            .frame(width: 40, height: 40)
            .padding(.all, 30)
        }
    }
}

struct ShelterInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ShelterInfoView(shelter: ShelterModel().safeShelters.first!)
    }
}
