//
//  ChoicesView.swift
//  Activities
//
//  Created by Raghavendra Mikkilineni on 10/05/21.
//

import SwiftUI

struct ChoicesView: View {
    var choices: Array<PCollection>
    
    private func imageView(choice: PCollection) -> some View {
        return ZStack {
            Image(choice.imageName)
                .resizable()
                .frame(width: ChoicesView.choicesImageWidth, height: ChoicesView.choicesImageHeight)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            Color.black
                .opacity(0.4)
                .frame(width: ChoicesView.choicesImageWidth, height: ChoicesView.choicesImageHeight)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            
            titleView(title: choice.collectionName)
        }
    }
    
    private func titleView(title: String) -> some View {
       return Text(title)
            .modifier(CustomFont(name: Assests.Font.avenirHeavy, size: 18))
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .frame(width: ChoicesView.choicesImageWidth, height: ChoicesView.choicesImageHeight)
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(0..<choices.count) { index in
                    imageView(choice: choices[index])
                }
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        }
    }
    
    private static let choicesImageHeight: CGFloat = 150
    private static let choicesImageWidth: CGFloat = 120
}

struct ChoicesView_Previews: PreviewProvider {
    static var previews: some View {
        ChoicesView(choices: Array<PCollection>())
    }
}
