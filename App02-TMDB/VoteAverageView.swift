//
//  VoteAverageView.swift
//  App02-TMDB
//
//  Created by Patricio Villarreal Welsh on 24/08/23.
//

import SwiftUI

struct VoteAverageView: View {
    var voteAverage: Double
    
    var body: some View {
        Circle()
            .fill(.black)
            .frame(width: 60)
            .overlay(
                ZStack {
                    VStack {
                        Text("\(voteAverage * 10, specifier: "%.0f")%")
                            .foregroundColor(Color.white)
                            .font(.title3)
                    }
                    Circle()
                        .stroke(Color.black, lineWidth: 10)
                    withAnimation {
                        Circle()
                            .trim(from: 0.0, to: CGFloat(min(voteAverage / 10, 1.0)))
                            .stroke(style: StrokeStyle(lineWidth: 5.0, lineCap: .round, lineJoin: .round))
                            .foregroundStyle(voteColor(voteAvarage: voteAverage))
                            .rotationEffect(Angle(degrees: 270.0))
                            .frame(width: 60, height: 60)
                    }
                }
            )
            .padding(.leading, 10)
            .padding(.bottom, -15)
    }
    
    private func voteColor(voteAvarage: Double) -> Color {
        if voteAvarage >= 7.5 {
            return Color.green
        } else if voteAvarage >= 4.0 {
            return Color.yellow
        } else {
            return Color.red
        }
    
    }
}

struct VoteAverageView_Previews: PreviewProvider {
    static var previews: some View {
        VoteAverageView(voteAverage: 4.9)
    }
}
