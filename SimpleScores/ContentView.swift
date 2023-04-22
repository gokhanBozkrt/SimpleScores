//
//  ContentView.swift
//  SimpleScores
//
//  Created by Gökhan Bozkurt on 21.04.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var scoreViewModel: ScoreViewModel
    @State private var showingClearAlert = false
    var body: some View {
        List {
            ForEach($scoreViewModel.items,content: ScoreRowView.init)
                .onDelete(perform: scoreViewModel.delete)
            Button(action: scoreViewModel.add) {
                Label("Add Player", systemImage: "plus")
                    .font(.title.bold())
                    .frame(maxWidth: .infinity,minHeight: 44)
                    .contentShape(Rectangle())
            }
            .disabled(scoreViewModel.items.count == ColorChoice.allCases.count)
          
        }
        .animation(.default, value: scoreViewModel.items)
        .navigationTitle("SimpleScores")
        .listStyle(.plain)
        .buttonStyle(.plain)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: scoreViewModel.reset) {
                    Label("Reset Scores to 0", systemImage: "arrow.counterlockwise")
                }
                .disabled(scoreViewModel.items.isEmpty)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showingClearAlert = true
                } label: {
                    Label("Remove All", systemImage: "trash")
                }
                .disabled(scoreViewModel.items.isEmpty)
            }
        }
        .alert("Delete all players?", isPresented: $showingClearAlert) {
            Button("Delete", role: .destructive, action: scoreViewModel.deleteAll)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("This will immediately remove all players and their scores.")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(scoreViewModel: ScoreViewModel())
    }
}
