//
//  MapAnnotationView.swift
//  KoiraApp
//
//  Created by Roman Zakharov on 4.11.2022.
//

import SwiftUI

struct MapAnnotationView: View {
    var shelter: Shelter
    @State private var animation: Double = 0.0
    @State private var showModal: Bool = false

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)

            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)

            Image(systemName: shelter.icon)
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .frame(width: 35, height: 35, alignment: .center)
                .clipShape(Circle())
        }
        .onAppear {
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
        .onTapGesture {
            showModal.toggle()
        }
        .sheet(isPresented: self.$showModal) {
            ShelterInfoView(shelter: shelter)
        }
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        MapAnnotationView(shelter: ShelterModel().safeShelters.first!)
            .previewLayout(.sizeThatFits)
    }
}
