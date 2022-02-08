//
//  InstructionView.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/9/22.
//

import SwiftUI

struct InstructionView: View {
    var body: some View {
        ZStack {
            Resources.Colors.background
                .ignoresSafeArea()
            
            TabView {
                VStack {
                    Text(Constants.foodTitle)
                        .font(Resources.Fonts.molle(size: 24))
                        .foregroundColor(Resources.Colors.main)
                    Canvas { context, size in
                        let image = context.resolve(Resources.Images.sausage)
                        let currentPoint = CGPoint(x: size.width * 0.5 - 25, y: size.height / 2 - 25)
                        context.draw(image, in: CGRect(origin: currentPoint, size:CGSize(width: 50, height: 50)), style: .init(eoFill: true, antialiased: true))
                        context.stroke(Path(ellipseIn: CGRect(x: size.width / 2 - 35, y: size.height / 2 - 35, width: 70, height: 70)), with: .color(Resources.Colors.main), lineWidth: 3)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 100, alignment: .center)
                    HStack {
                        Resources.Images.burger
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Resources.Images.milk
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Resources.Images.sausage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .frame(maxHeight: 200, alignment: .center)
                    
                }
                .padding(40)
                .tag(0)

                VStack {
                    Text(Constants.hurtTitle)
                        .font(Resources.Fonts.molle(size: 24))
                        .foregroundColor(Resources.Colors.main)
                    HStack {
                        Resources.Images.toxic
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Resources.Images.bottle
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .frame(maxHeight: 200, alignment: .center)
                }
                .padding(40)
                .tag(1)
                
                VStack {
                    Text(Constants.lifeTitle)
                        .font(Resources.Fonts.molle(size: 24))
                        .foregroundColor(Resources.Colors.main)
                    Image(systemName: "heart.fill")
                        .scaleEffect(3)
                        .foregroundColor(Resources.Colors.main)
                        .padding(.top, 30)
                }
                .padding(40)
                .tag(2)
            }
            .tabViewStyle(.page)
        }
    }
    
    private enum Constants {
        static let foodTitle: String = "Feed the cat with food when it is in the center of the ring!"
        static let hurtTitle: String = "Avoid feeding the cat with items that my heart it!"
        static let lifeTitle: String = "Collect extra lives to extend your cat's live!"
    }
}

struct InstructionView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionView()
    }
}
