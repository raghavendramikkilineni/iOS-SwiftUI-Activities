//
//  SegmentScrollView.swift
//  Activities
//
//  Created by Raghavendra Mikkilineni on 10/05/21.
//

import SwiftUI

struct SegmentScrollView: View {
    @Binding var selectedIndex: Int
    @State private var frames = [CGRect](repeating: .zero, count: 100)
    var disabledViewIndex: [Int]
    
    var labelViews: [Text] {
        didSet {
            frames = [CGRect](repeating: .zero, count: labelViews.count)
        }
    }
    
    var body: some View {
        ScrollView(Axis.Set.horizontal, showsIndicators: false) {
            ScrollViewReader { scrollViewProxy in
                ZStack {
                    HStack(spacing: 10) {
                        ForEach(labelViews.indices, id: \.self) { index in
                            button(index, scrollViewProxy: scrollViewProxy)
                        }
                    }
                    .background(background, alignment: .leading)
                }
                .animation(.default)
                
            }
        }
        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
    }
    
    private func button(_ index: Array<String>.Index, scrollViewProxy: ScrollViewProxy) -> some View {
        Button(action: {
            selectedIndex = index
            scrollViewProxy.scrollTo(index)
        }, label: {
            HStack {
                labelViews[index]
                    .frame(minWidth: 50, maxWidth: 300, alignment: .center)
                    .padding(.vertical, 15)
                    .padding(.horizontal, 5)
                    .modifier(CustomFont(name: Assests.Font.avenirMedium, size: 18))
                    .foregroundColor(selectedIndex == index ? Assests.Color.titleChoiceColor : Assests.Color.titleChoiceColor)
            }
            .frame(maxWidth: .infinity)
            .disabled(disabledViewIndex.contains(index))
            .background(
                GeometryReader { geometry in
                    buttonBackground(geometry: geometry, index: index)
                }
            )
        })
    }
    
    private func buttonBackground(geometry: GeometryProxy, index: Int) -> AnyView {
        DispatchQueue.main.async {
            frames[index] = geometry.frame(in: .global)
        }
        return AnyView(Color.clear)
    }
    
    private var background: some View {
        VStack {
            Spacer()
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Assests.Color.titleChoiceColor)
                    .frame(width: frames[selectedIndex].width, height: 3, alignment: .topLeading)
                    .offset(x: frames[selectedIndex].minX - frames[0].minX)
            }
        }
    }
}

