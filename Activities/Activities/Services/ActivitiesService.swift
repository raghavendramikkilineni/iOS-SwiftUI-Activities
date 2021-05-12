//
//  ActivitiesService.swift
//  Activities
//
//  Created by Raghavendra Mikkilineni on 09/05/21.
//

import Foundation

protocol ActivitiesService {
    func loadActivities(completion: (Array<Carousel>, String, Array<PCollection>, Array<Category>, Array<ActivityCollection>, Activities?) -> Void)
}

struct RealActivitiesService: ActivitiesService {
    func loadActivities(completion: (Array<Carousel>, String, Array<PCollection>, Array<Category>, Array<ActivityCollection>, Activities?) -> Void) {
        let data = Bundle.main
            .url(forResource: "activities", withExtension: "json")
            .flatMap { try? Data(contentsOf: $0) }
        
        if let activitiesData = data {
            do {
                let activities = try JSONDecoder().decode(Activities.self, from: activitiesData)
                let carousels = activities.editorial.carousel.filter { activities.editorial.ttd.cp.contains($0.carouselId) }
                
                let choiceTitle = activities.editorial.ttd.p.title
                let choices = activities.editorial.ttd.p.collection
                var categories: Array<Category> = Array<Category>()
                categories.append(Category(name: "All", rank: 0, id: ""))
                categories += activities.categories
                let activityCollections = activities.collections
                completion(carousels, choiceTitle, choices, categories, activityCollections, activities)
            }catch {
                print("decode error \(error.localizedDescription)")
            }
        }
    }
}
