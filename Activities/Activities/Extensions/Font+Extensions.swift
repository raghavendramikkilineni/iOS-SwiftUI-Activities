//
//  Font+Extensions.swift
//  Activities
//
//  Created by Raghavendra Mikkilineni on 09/05/21.
//

import SwiftUI

struct CustomFont: ViewModifier {
    var name: String
    var size: CGFloat
    
    func body(content: Content) -> some View {
        let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(.custom(name, size: scaledSize))
    }
}

extension UIScreen {
    static let width = UIScreen.main.bounds.width
}
