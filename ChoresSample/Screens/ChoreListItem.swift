//
//  ChoreListItem.swift
//  ChoresSample
//
//  Created by Adam Whitcroft on 2022-08-13.
//

import SwiftUI

struct ChoreListItem: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @ObservedObject var chore: Chore
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(chore.unwrappedChoreName)")
            
            VStack(alignment: .leading) {
                // Unformatted date
                if let actualDate = chore.updatedDate {
                    Text("**Actual date:** \(actualDate, style: .date) at \(actualDate, style: .time)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                // Date formatted with timeAgo()
                if let formattedLastActivityDate = chore.updatedDate {
                    Text("**Formatted date:** \(formattedLastActivityDate.timeAgo())")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}
