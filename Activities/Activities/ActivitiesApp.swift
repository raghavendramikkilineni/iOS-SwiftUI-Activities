//
//  ActivitiesApp.swift
//  Activities
//
//  Created by Raghavendra Mikkilineni on 09/05/21.
//

import SwiftUI

@main
struct ActivitiesApp: App {
    var body: some Scene {
        WindowGroup {
            ActivitiesView(viewModel: ActivitiesView.ActivitiesViewModel())
        }
    }
}
