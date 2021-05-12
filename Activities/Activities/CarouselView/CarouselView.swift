//
//  CarouselView.swift
//  Activities
//
//  Created by Raghavendra Mikkilineni on 09/05/21.
//

import SwiftUI

struct CarouselView: View {
    var carousels: Array<Carousel>
    
    private func image(imageName: String,
                       title: String,
                       subTitle: String,
                       tagText: String) -> some  View {
        return ZStack {
            GeometryReader { geometry in
                ZStack{
                    Image(imageName)
                        .resizable()
                        .frame(width: geometry.size.width, height: CarouselView.heightImage)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    
                    Color.black
                        .opacity(0.4)
                        .frame(width: geometry.size.width, height: CarouselView.heightImage)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                }
            }
            
            VStack {
                Text(tagText)
                    .modifier(CustomFont(name: Assests.Font.avenirBook, size: 15))
                    .foregroundColor(.white)
                    .padding()
                Text(title)
                    .modifier(CustomFont(name: Assests.Font.avenirHeavy, size: 20))
                    .foregroundColor(.white)
                    .frame(alignment: .center)
                    .padding(.bottom, -10)
                Text(subTitle)
                    .modifier(CustomFont(name: Assests.Font.avenirBook, size: 15))
                    .foregroundColor(.white)
                    .padding(5)
            }
        }
        .padding(10)
    }
    
    var body: some View {
        TabView {
            ForEach(carousels, id: \.self) { carousel in
                image(imageName: carousel.images[0].img, title: carousel.title, subTitle: carousel.subTitle,
                      tagText: carousel.tagText.rawValue)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
    }
    
    static private let heightImage: CGFloat = 200
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView(carousels: Array<Carousel>())
    }
}

