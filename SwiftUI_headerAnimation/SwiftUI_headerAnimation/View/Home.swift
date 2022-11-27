//
//  Home.swift
//

import SwiftUI

struct Home: View {
    var body: some View {
        GeometryReader { geo in
            let safeAreaTop = geo.safeAreaInsets.top
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    header(safeAreaTop)
                }
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}

extension Home {
    private func header(_ safeAreaTop: CGFloat) -> some View {
        ZStack {
            VStack {
                HStack(spacing: 15) {
                    HStack(spacing: 8) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                        
                        TextField("Search", text: .constant(""))
                            .tint(.red)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.black.opacity(0.15))
                    }
                }
            }
            .environment(\.colorScheme, .dark)
            .padding([.horizontal, .bottom], 15)
            .padding(.top, safeAreaTop + 10)
            .background {
                Rectangle()
                    .fill(.red)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
