//
//  ChoresList.swift
//  ChoresSample
//
//  Created by Adam Whitcroft on 2022-08-13.
//

import SwiftUI

struct ChoresList: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\.updatedDate, order: .reverse)]) var chores: FetchedResults<Chore>
    @State var showCreateChoreSheet = false
    
    var body: some View {
        NavigationView {
            Form {
                NoteToTester(testerNote: "Add a chore and then drill into that view. Read the instructions at the top of the page.")
                
                Section {
                    Button {
                        showCreateChoreSheet.toggle()
                    } label: {
                        Text("Add chore")
                    }
                }
                
                Section {
                    ForEach(chores) { chore in
                        NavigationLink {
                            ChoreDetailView(chore: chore)
                        } label: {
                            ChoreListItem(chore: chore)
                        }
                    }
                }
            }
            .navigationBarTitle("Chores")
            .sheet(isPresented: $showCreateChoreSheet) {
                CreateChore()
            }
        }
    }
}
