//
//  ContentView.swift
//  Trvel
//
//  Created by Mohamad Dzul Syakimin on 03/06/2023.
//

import SwiftUI

struct Home: View {
    var size: CGSize
    var safeArea: EdgeInsets
    @State private var scrollProgress: CGFloat = 0
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 12) {
                Image("dzul_image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 130 - (75 * scrollProgress), height: 130 - (75 * scrollProgress))
                    .blur(radius: scrollProgress * 10, opaque: true)
                    .clipShape(Circle())
                    .anchorPreference(key:AnchorKey.self, value: .bounds, transform: {
                        return ["HEADER": $0]
                    })
                    .padding(.top, safeArea.top + 15)
                    .offsetExtractor(coordinateSpace: "SCROLLVIEW") { scrollRect in
                        let progress = -scrollRect.minY / 25
                        scrollProgress = min(max(progress, 0), 1)
                    }
                
                Text("Dzul Syakimin").font(.caption).foregroundColor(.gray).padding(.vertical, 15)
                
                SampleRows()
            }
            .frame(maxWidth: .infinity)
        }
        .backgroundPreferenceValue(AnchorKey.self, { pref in
            GeometryReader { proxy in
                if let anchor = pref["HEADER"] {
                    let frameRect = proxy[anchor]
                    
                    Circle()
                        .fill(.black)
                        .frame(width: frameRect.width, height: frameRect.height)
                        .offset(x:frameRect.minX, y: frameRect.minY)
                }
            }
        })
        .coordinateSpace(name: "SCOLLVIEW")
    }

    /// Sample Rows
    @ViewBuilder
    func SampleRows() -> some View {
        VStack{
            ForEach(1...20, id: \.self) { _ in
                RoundedRectangle(cornerRadius: 5, style: .continuous).fill(.gray.opacity(0.15)).frame(height: 25)
                
                RoundedRectangle(cornerRadius: 5, style: .continuous).fill(.gray.opacity(0.15)).frame(height: 50)
                
                RoundedRectangle(cornerRadius: 5, style: .continuous).fill(.gray.opacity(0.15)).frame(height: 150)
            }
        }
        .padding(.horizontal, 15)
        .padding(.bottom, safeArea.bottom + 15)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
