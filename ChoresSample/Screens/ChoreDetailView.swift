//
//  ChoreDetailView.swift
//  ChoresSample
//
//  Created by Adam Whitcroft on 2022-08-13.
//

import SwiftUI

struct ChoreDetailView: View {
    @ObservedObject var chore: Chore
    @State var showCreateActivitySheet = false
    
    var body: some View {
        Form {
            
            Section {
                Button {
                    showCreateActivitySheet.toggle()
                } label: {
                    Text("Add activity")
                }
            }
            
            Section {
                ForEach(chore.activitiesArray) { activity in
                    VStack(alignment: .leading) {
                        Text("\(activity.unwrappedChoreEntry)")
                        
                        if let activityDate = activity.date {
                            Text("\(activityDate.timeAgo())")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
        .navigationTitle("\(chore.unwrappedChoreName)")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showCreateActivitySheet) {
            CreateActivity(chore: chore)
        }
    }
}
