//
//  SimpleScoresApp.swift
//  SimpleScores
//
//  Created by Gökhan Bozkurt on 21.04.2023.
//

import SwiftUI

@main
struct SimpleScoresApp: App {
   @StateObject var scoreViewModel = ScoreViewModel()
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(scoreViewModel: scoreViewModel)
            }
            .navigationViewStyle(.stack)
            .preferredColorScheme(.dark)
        }
        .onChange(of: scenePhase) { phase in
            if phase == .background {
                scoreViewModel.save()
            }
        }
    }
}
