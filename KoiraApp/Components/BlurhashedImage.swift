//
//  BlurhashedImage.swift
//  KoiraApp
//
//  Created by Roman Zakharov on 5.11.2022.
//

import SwiftUI

struct BlurhashedImage: View {
    var image: BlurHashedImageModel
    var body: some View {
        AsyncImage(url: URL(string: backendURL + image.url)) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            if let uiImage = UIImage(blurHash: image.blurhash, size: CGSize(width: 100, height: 100)) {
                Image(uiImage: uiImage)
                    .resizable()
            } else {
                Color(.gray)
            }
        }
    }
}

//struct BlurhashedImage_Previews: PreviewProvider {
//    static var previews: some View {
//        BlurhashedImage()
//    }
//}
