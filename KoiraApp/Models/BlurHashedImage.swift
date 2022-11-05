//
//  BlurImage.swift
//  KoiraApp
//
//  Created by Roman Zakharov on 5.11.2022.
//

struct BlurHashedImage: Codable, Identifiable {
    var id: String
    var url: String
    var blurhash: String
}
