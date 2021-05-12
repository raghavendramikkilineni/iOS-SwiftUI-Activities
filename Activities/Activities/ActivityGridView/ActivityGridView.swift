//
//  ActivityGridView.swift
//  Activities
//
//  Created by Raghavendra Mikkilineni on 10/05/21.
//

import SwiftUI

struct ActivityGridView: View {
    var compositionalCollections: Array<Array<ActivityCollection>>
   
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: 10) {
                ForEach(0..<compositionalCollections.count, id: \.self) { index in
                    GridView(compostionalArray: compositionalCollections[index])
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
        }
    }
    
    private static let actvityImageHeight: CGFloat = 150
}

struct ActivityGridView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityGridView(compositionalCollections: Array<Array<ActivityCollection>>())
    }
}

