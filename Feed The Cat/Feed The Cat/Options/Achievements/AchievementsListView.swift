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
        VStack {
            if viewModel.isLoading {
                ProgressView()
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
        }
        .background(Resources.Colors.background)
        .onAppear {
            viewModel.startSubject.send(Void())
        }
    }
}
