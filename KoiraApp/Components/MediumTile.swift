//
//  MediumTile.swift
//  KoiraApp
//
//  Created by Roman Zakharov on 4.11.2022.
//

import SwiftUI

struct MediumTile: View {
    var title: String
    var imageName: String

    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(.init("AppOrange"))
            VStack {
                Text(title)
                    .foregroundColor(.black)
                    .padding(.all, 16)

                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.black)
                    .padding(.all, 16)
            }
        }
        .padding(.all, 4)
        .frame(height: 180)
    }
}

struct MediumTile_Previews: PreviewProvider {
    static var previews: some View {
        MediumTile(title: "Shelters", imageName: "house")
            .previewLayout(.sizeThatFits)
    }
}
