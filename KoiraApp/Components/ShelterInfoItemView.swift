//
//  ShelterInfoItemView.swift
//  KoiraApp
//
//  Created by Roman Zakharov on 4.11.2022.
//

import SwiftUI

struct ShelterInfoItemView: View {
    var image: String
    var text: String

    var body: some View {
        ZStack {
            HStack {
                ZStack {
                    Image(systemName: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
                .frame(width: 50, height: 50)
                .padding(.trailing, 30)

                Text(text)
            }
            .padding()
        }
    }
}

struct ShelterInfoItemView_Previews: PreviewProvider {
    static var previews: some View {
        ShelterInfoItemView(image: "phone", text: "050 234232")
            .previewLayout(.sizeThatFits)
    }
}
