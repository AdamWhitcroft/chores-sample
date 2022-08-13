//
//  ChoreListItem.swift
//  ChoresSample
//
//  Created by Adam Whitcroft on 2022-08-13.
//

import SwiftUI

struct ChoreListItem: View {
    @ObservedObject var chore: Chore
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(chore.unwrappedChoreName)")
            
            if let lastChoreActivityDate = chore.updatedDate {
                Text("\(lastChoreActivityDate.timeAgo())")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}
