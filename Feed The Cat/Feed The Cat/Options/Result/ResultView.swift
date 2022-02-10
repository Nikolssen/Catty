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
        ZStack {
            Resources.Colors.background
                .ignoresSafeArea()
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                        .scaleEffect(3)
                }
                if let models = viewModel.results {
                    ScrollView {
                        LazyVGrid(columns: [.init(.flexible(), spacing: 20, alignment: .center)]) {
                            ForEach(models, id: \.index) { model in
                                HStack {
                                    Text(model.player)
                                    VStack {
                                        Text(model.date)
                                        Text("Score: " + model.score)
                                    }
                                }
                                .font(Resources.Fonts.molle(size: 18))
                                .foregroundColor(Resources.Colors.main)
                                .padding(.vertical)
                                .frame(maxWidth: .infinity, minHeight: 50, alignment: .center)
                                .background(GlassView())
                                .clipShape(Capsule(style: .continuous))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .onAppear {
            viewModel.startSubject.send(Void())
        }
    }
}
