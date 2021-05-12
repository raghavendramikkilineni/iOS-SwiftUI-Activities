//
//  ActivitiesViewModel.swift
//  Activities
//
//  Created by Raghavendra Mikkilineni on 09/05/21.
//

import Foundation

extension ActivitiesView {
    class ActivitiesViewModel: ObservableObject {
        @Published var carousels: Array<Carousel> = Array<Carousel>()
        @Published var choiceTitle: String = String()
        @Published var choices: Array<PCollection> = Array<PCollection>()
        @Published var categories: Array<Category> = Array<Category>()
        //filtering activities, segment selected index.
        @Published var selectedIndex: Int = 0 {
            didSet {
                let selectedCategory = categories[selectedIndex]
                self.activityCollections = []
                if selectedCategory.name == "All" {
                    self.activityCollections = activities?.collections ?? []
                }else {
                    self.activityCollections = activities?.collections.filter { $0.categories?[0] == selectedCategory.id } ?? []
                }
                setCompostionalCollections()
            }
        }
        @Published var activityCollections: Array<ActivityCollection> = Array<ActivityCollection>()
        @Published var compositionalCollections: Array<Array<ActivityCollection>> = Array<Array<ActivityCollection>>()
        
        private var activities: Activities?
        init() {
            fetchActivities()
        }
        
        private func fetchActivities() {
            RealActivitiesService().loadActivities { [weak self] (carousels, choiceTitle, choices, categories, activityCollections, activities)  in
                self?.carousels += carousels
                self?.choiceTitle = choiceTitle
                self?.choices = choices
                self?.categories = categories
                self?.activityCollections = activityCollections
                setCompostionalCollections()
                if let activity = activities {
                    self?.activities = activity
                }
            }
        }
        
        // Logic for separation of activies for compositional layout.
        private func setCompostionalCollections() {
            compositionalCollections = Array<Array<ActivityCollection>>()
            var tempCollections: Array<ActivityCollection> = []
            for (_, collection) in activityCollections.enumerated() {
                tempCollections.append(collection)
                //image grid layout
                if tempCollections.count == 3 {
                    compositionalCollections.append(tempCollections)
                    tempCollections.removeAll()
                }
                //Single Image Card
                if tempCollections.count != 3 && collection.id == activityCollections.last?.id {
                    compositionalCollections.append(tempCollections)
                    tempCollections.removeAll()
                }
            }
        }
    }
}
