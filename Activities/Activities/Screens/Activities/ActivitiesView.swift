//
//  ActivitiesView.swift
//  Activities
//
//  Created by Raghavendra Mikkilineni on 09/05/21.
//

import SwiftUI

struct ActivitiesView: View {
    @ObservedObject private(set) var viewModel: ActivitiesViewModel
    
    private var carouselView: some View {
        CarouselView(carousels: viewModel.carousels)
            .frame(height: 220)
    }
    
    private var choiceTitle: some View {
        Text(viewModel.choiceTitle)
            .frame(alignment: .leading)
            .modifier(CustomFont(name: Assests.Font.avenirMedium, size: 18))
            .foregroundColor(Assests.Color.titleChoiceColor)
            .padding(.leading, 10)
    }
    
    private var choicesView: some View {
        ChoicesView(choices: viewModel.choices)
            .frame(height: 150)
            .padding(.bottom, 5)
    }
    
    private var line: some View {
        Divider()
            .background(Assests.Color.titleChoiceColor)
    }
    
    private var segmentScrollView: some View {
        VStack(spacing: 0) {
            line
            SegmentScrollView(selectedIndex: $viewModel.selectedIndex,
                              disabledViewIndex: [],
                              labelViews: labelViews())
            line
        }
    }
    
    private func labelViews() -> Array<Text> {
        var labelViews: Array<Text> = Array<Text>()
        for catogery in viewModel.categories {
            labelViews.append(Text(catogery.name))
        }
        return labelViews
    }
    
    private var activityGridView: some View {
        ActivityGridView(compositionalCollections: viewModel.compositionalCollections)
    }
    
    private var navigation: some View {
        NavigationView {
            content
                .navigationBarTitle("Activities")
                .edgesIgnoringSafeArea(.bottom)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private var content: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .leading, spacing: 10) {
                carouselView
                choiceTitle
                choicesView
                segmentScrollView
                activityGridView
            }
            .padding(EdgeInsets(top: 5, leading: 0, bottom: 30, trailing: 0))
        }
    }
    
    var body: some View {
        navigation
    }
}

struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView(viewModel: ActivitiesView.ActivitiesViewModel())
    }
}
