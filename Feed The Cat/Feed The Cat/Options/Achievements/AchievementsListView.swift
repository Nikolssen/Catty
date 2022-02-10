//
//  AchievementsListView.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/10/22.
//

import SwiftUI

struct AchievementsListView: View {
    @StateObject var viewModel: AchievementViewModel
    var body: some View {
        ZStack {
            Resources.Colors.background
                .ignoresSafeArea()
            if viewModel.isLoading {
                ProgressView()
            }
            if let models = viewModel.models{
                ScrollView {
                    LazyVGrid(columns: [.init(.flexible(minimum: 50, maximum: .infinity), spacing: 20, alignment: .center)]) {
                        ForEach(models, id: \.index) {
                            AchievementView(achievement: $0.achievement, isPosessed: $0.isPosessed)
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.startSubject.send(Void())
        }
    }
}
