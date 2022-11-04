//
//  ShelterInfoView.swift
//  KoiraApp
//
//  Created by Roman Zakharov on 4.11.2022.
//

import SwiftUI

struct ShelterInfoView: View {
    var shelter: Shelter

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                
                Text(shelter.name)
                    .font(.largeTitle)

                Spacer()
            }

            if let imageURL = shelter.image_url {
                AsyncImage(url: URL(string: imageURL)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.size.width, height: 300, alignment: .center)
                        .clipped()
                } placeholder: {
                    Color.gray
                        .frame(width: UIScreen.main.bounds.size.width, height: 300, alignment: .center)
                }
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
        }
    }
}
