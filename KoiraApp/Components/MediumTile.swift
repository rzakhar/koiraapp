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
            VStack(spacing: 0) {
                Text(title)
                    .foregroundColor(.black)
                    .padding(.top, 16)
                    .padding(.horizontal, 16)

                HStack {
                    Spacer()
                    
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .padding(.all, 5)
                    
                    Spacer()
                }
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
