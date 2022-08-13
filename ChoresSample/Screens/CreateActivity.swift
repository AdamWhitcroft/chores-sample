//
//  CreateActivity.swift
//  ChoresSample
//
//  Created by Adam Whitcroft on 2022-08-13.
//

import SwiftUI

struct CreateActivity: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
    
    var chore: Chore
    
    @State private var activityEntry: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Activity notes", text: $activityEntry)
                    .onSubmit {
                        if !activityEntry.isEmpty {
                            createActivity(chore: chore)
                        }
                    }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Add activity")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        createActivity(chore: chore)
                    } label: {
                        Text("Add")
                    }
                }
            }
        }
    }
    
    private func createActivity(chore: Chore) {
        let newActivity = Activity(context: viewContext)
        newActivity.date = Date()
        newActivity.entry = activityEntry
        chore.updatedDate = Date()
        chore.addToActivities(newActivity)
        PersistenceController.shared.saveContext()
        dismiss()
    }
}
