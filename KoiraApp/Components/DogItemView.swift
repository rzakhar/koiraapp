//
//  DogDetailsView.swift
//  KoiraApp
//
//  Created by Roman Zakharov on 5.11.2022.
//

import SwiftUI

struct DogItemView: View {
    var dog: Dog
    @State private var showModal: Bool = false

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            if let image = dog.images.first! {
                BlurhashedImage(image: image)
                    .frame(height: 200, alignment: .center)
                    .cornerRadius(16)
            }
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 300)
                    .foregroundColor(.accentColor)

                Text(dog.name)
                    .foregroundColor(.black)
            }
            .padding(.all, 20)
            .frame(width: 150, height: 40)
        }
        .frame(height: 200)
        .frame(maxWidth: 600)
        .padding(.vertical, 10)
        .onTapGesture {
            showModal.toggle()
        }
        .sheet(isPresented: self.$showModal) {
            DogInfoView(dog: dog)
        }
    }
}

struct DogItemView_Previews: PreviewProvider {
    static var previews: some View {
        DogItemView(dog: DogModel().safeDogs.first!)
            .previewLayout(.sizeThatFits)
    }
}
