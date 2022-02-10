//
//  GameWinnerView.swift
//  BoardGame
//
//  Created by Szymon Szysz on 06/02/2022.
//

import SwiftUI

struct GameWinnerView: View {
    @Environment(\.presentationMode) var presentationMode
    var winnerList: [User]
    
    init(winnerList: [User]) {
        self.winnerList = winnerList
    }
    
    
    var body: some View {
        
        VStack {
            HStack {
            Text("The winner is ...")
                .font(.largeTitle)
                Spacer()
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                }
            }
            .padding()
            HStack {
                CrownView(imageColor: .yellow, name: "Ania").padding(.bottom, 50)
            }
            
            List(winnerList, id: \.id) { winner in
                Text(winner.name)
            }
            .cornerRadius(radius: 50, corners: [.topLeft, .topRight])
            .ignoresSafeArea()
            .onAppear {
                // Set the default to clear
                UITableView.appearance().backgroundColor = .clear
            }
            .padding()
        }
        .background(.yellow)
        

    }
}

//struct GameWinnerView_Previews: PreviewProvider {
//    static var previews: some View {
////        GameWinnerView(winnerList: <#[User]#>)
//    }
//}


struct CrownView: View {
    
    private let imageColor: Color
    private let name: String
    
    var animation: Animation {
        Animation
            .easeInOut(duration: 1.5)
            .repeatForever()
    }
    
    init(imageColor: Color, name: String) {
        self.imageColor = imageColor
        self.name = name
    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
            
            VStack {

                Image(systemName: "crown.fill")
                    .renderingMode(.original)
                    .font(.largeTitle)
                    .foregroundColor(imageColor)
                    .rotation3DEffect(.degrees(360), axis: (x: 0, y: 1, z: 0))
                    .animation(animation)
                
                Text(name)
                    .font(.title2)
                    
            }
        }

       
    }
}

struct BadgeBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                path.move(
                    to: CGPoint(
                        x: width * 0.95 + xOffset,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )

                HexagonParameters.segments.forEach { segment in
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )

                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y
                        ),
                        control: CGPoint(
                            x: width * segment.control.x + xOffset,
                            y: height * segment.control.y
                        )
                    )
                }
            }
            .fill(.linearGradient(
                Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
        }
        .aspectRatio(1, contentMode: .fit)
    }
    static let gradientStart = Color(red: 129.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}


struct HexagonParameters {
    struct Segment {
        let line: CGPoint
        let curve: CGPoint
        let control: CGPoint
    }

    static let adjustment: CGFloat = 0.085

    static let segments = [
        Segment(
            line:    CGPoint(x: 0.60, y: 0.05),
            curve:   CGPoint(x: 0.40, y: 0.05),
            control: CGPoint(x: 0.50, y: 0.00)
        ),
        Segment(
            line:    CGPoint(x: 0.05, y: 0.20 + adjustment),
            curve:   CGPoint(x: 0.00, y: 0.30 + adjustment),
            control: CGPoint(x: 0.00, y: 0.25 + adjustment)
        ),
        Segment(
            line:    CGPoint(x: 0.00, y: 0.70 - adjustment),
            curve:   CGPoint(x: 0.05, y: 0.80 - adjustment),
            control: CGPoint(x: 0.00, y: 0.75 - adjustment)
        ),
        Segment(
            line:    CGPoint(x: 0.40, y: 0.95),
            curve:   CGPoint(x: 0.60, y: 0.95),
            control: CGPoint(x: 0.50, y: 1.00)
        ),
        Segment(
            line:    CGPoint(x: 0.95, y: 0.80 - adjustment),
            curve:   CGPoint(x: 1.00, y: 0.70 - adjustment),
            control: CGPoint(x: 1.00, y: 0.75 - adjustment)
        ),
        Segment(
            line:    CGPoint(x: 1.00, y: 0.30 + adjustment),
            curve:   CGPoint(x: 0.95, y: 0.20 + adjustment),
            control: CGPoint(x: 1.00, y: 0.25 + adjustment)
        )
    ]
}


struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner

    struct CornerRadiusShape: Shape {

        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}
