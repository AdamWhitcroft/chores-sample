//
//  CreateChore.swift
//  ChoresSample
//
//  Created by Adam Whitcroft on 2022-08-13.
//

import SwiftUI

struct CreateChore: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
    
    @State private var choreName: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Chore name", text: $choreName)
                    .onSubmit {
                        if !choreName.isEmpty {
                            createChore()
                        }
                    }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Add chore")
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
                        createChore()
                    } label: {
                        Text("Add")
                    }
                }
            }
        }
    }
    
    private func createChore() {
        let newChore = Chore(context: viewContext)
        newChore.name = choreName
        newChore.updatedDate = Date()
        PersistenceController.shared.saveContext()
        dismiss()
    }
}
