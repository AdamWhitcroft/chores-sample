//
//  ChoreDetailView.swift
//  ChoresSample
//
//  Created by Adam Whitcroft on 2022-08-13.
//

import SwiftUI

struct ChoreDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var chore: Chore
    @State var showCreateActivitySheet = false
    
    var body: some View {
        Form {
            NoteToTester(testerNote: "Create an activity here, then wait at least a minute. Minimize the app on this view and come back, you'll see the time ago has updated correctly (ie \"1m ago\". Then, go back to the \"Chores\" view, you'll see the time ago does not match.")
            
            Section {
                Button {
                    createActivity(chore: chore)
                } label: {
                    Text("Add activity")
                }
            }
            
            Section {
                ForEach(chore.activitiesArray) { activity in
                    VStack(alignment: .leading) {
                        Text("\(activity.unwrappedChoreEntry)")
                        
                        
                        VStack(alignment: .leading) {
                            // Unformatted date
                            if let actualDate = activity.date {
                                Text("Actual date: \(actualDate, style: .date) at \(actualDate, style: .time)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            
                            // Date formatted with timeAgo()
                            if let formattedActivityDate = activity.date {
                                Text("Formatted date: \(formattedActivityDate.timeAgo())")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("\(chore.unwrappedChoreName)")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: Create activity
    private func createActivity(chore: Chore) {
        let newActivity = Activity(context: viewContext)
        newActivity.date = Date()
        newActivity.entry = "Dummy activity"
        chore.updatedDate = Date()
        chore.addToActivities(newActivity)
        PersistenceController.shared.saveContext()
    }
}
