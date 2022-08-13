//
//  ChoresSampleApp.swift
//  ChoresSample
//
//  Created by Adam Whitcroft on 2022-08-13.
//

import SwiftUI

@main
struct ChoresSampleApp: App {
    let persistanceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ChoresList()
                .environment(\.managedObjectContext, persistanceController.viewContext)
        }
    }
}
