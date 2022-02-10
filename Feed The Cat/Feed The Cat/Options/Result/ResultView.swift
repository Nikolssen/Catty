//
//  ResultView.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/6/22.
//

import SwiftUI

struct ResultView: View {
    @StateObject var viewModel: ResultViewModel
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
                    .scaleEffect(3)
            }
            if let models = viewModel.results {
                List {
                    ForEach(models, id: \.index) {
                        Text($0.result.player)
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
