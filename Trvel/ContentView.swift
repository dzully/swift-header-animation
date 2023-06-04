//
//  ContentView.swift
//  Trvel
//
//  Created by Mohamad Dzul Syakimin on 03/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader{
            let size = $0.size
            let safeArea = $0.safeAreaInsets

            Home(size: size, safeArea: safeArea)
                .ignoresSafeArea(.all, edges: .all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
