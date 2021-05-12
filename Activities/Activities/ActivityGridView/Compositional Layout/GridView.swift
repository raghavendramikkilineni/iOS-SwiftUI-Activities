//
//  DoubleImageView.swift
//  Activities
//
//  Created by Raghavendra Mikkilineni on 11/05/21.
//

import SwiftUI

struct GridView: View {
    var compostionalArray: Array<ActivityCollection>
    
    private func content(activity: ActivityCollection, imageWidth: CGFloat, labelWidth: CGFloat) -> some View {
        return ZStack {
            ZStack {
                Image(activity.imageName)
                    .resizable()
                    .frame(width: imageWidth, height: GridView.actvityImageHeight)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                
                Color.black
                    .opacity(0.4)
                    .frame(width: imageWidth, height: GridView.actvityImageHeight)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading) {
                Spacer()
                Text(activity.collectionName)
                    .modifier(CustomFont(name: Assests.Font.avenirHeavyOblique, size: 16))
                    .foregroundColor(.white)
                    .frame(maxWidth: labelWidth, alignment: .leading)
                    .lineLimit(1)
                
                Text(activity.countText)
                    .modifier(CustomFont(name: Assests.Font.avenirLight, size: 12))
                    .foregroundColor(.white)
                    .frame(maxWidth: labelWidth, alignment: .leading)
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 5, trailing: 5))
        }
    }
    
    private var grid: some View {
        VStack(spacing: 10) {
            HStack(spacing: 10) {
                if compostionalArray.count >= 1 {
                    content(activity: compostionalArray[0], imageWidth: GridView.actvityImageWidth, labelWidth: GridView.actvityLabelWidth)
                }
                if compostionalArray.count >= 2 {
                    content(activity: compostionalArray[1], imageWidth: GridView.actvityImageWidth, labelWidth: GridView.actvityLabelWidth)
                }
            }
            if compostionalArray.count >= 3 {
                content(activity: compostionalArray[2], imageWidth: GridView.actvityImageFullWidth, labelWidth: GridView.actvityLabelFullWidth)
            }
        }
    }
    
    var body: some View {
        grid
    }
    
    private static let actvityImageHeight: CGFloat = 150
    private static let actvityImageWidth: CGFloat = UIScreen.width / 2 - 15
    private static let actvityImageFullWidth: CGFloat = UIScreen.width - 20
    private static let actvityLabelWidth: CGFloat = UIScreen.width / 2 - 30
    private static let actvityLabelFullWidth: CGFloat = UIScreen.width - 30
}

struct DoubleImageView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(compostionalArray: Array<ActivityCollection>())
    }
}
