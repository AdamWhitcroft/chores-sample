//
//  NoteToTester.swift
//  ChoresSample
//
//  Created by Adam Whitcroft on 2022-08-14.
//

import SwiftUI

struct NoteToTester: View {
    let testerNote: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("**Tester note:**")
            Text(testerNote)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .listRowInsets(EdgeInsets())
        .listRowBackground(Color(UIColor.systemGroupedBackground))
    }
}
