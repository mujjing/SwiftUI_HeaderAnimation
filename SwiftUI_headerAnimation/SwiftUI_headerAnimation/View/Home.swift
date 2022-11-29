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
                    
                    VStack {
                        ForEach(1...10, id: \.self) { _ in
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.blue.gradient)
                                .frame(height: 220)
                        }
                    }
                    .padding(15)
                }
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}

extension Home {
    private func header(_ safeAreaTop: CGFloat) -> some View {
        ZStack {
            VStack(spacing: 15) {
                HStack(spacing: 15) {
                    HStack(spacing: 8) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                        
                        TextField("Search", text: .constant(""))
                            .tint(.white)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.black.opacity(0.15))
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                            .background {
                                Circle()
                                    .fill(.white)
                                    .padding(-2)
                            }
                        
                    }

                }
                
                HStack(spacing: 0) {
                    customButton(symbolImage: "rectangle.portrait.and.arrow.forward", title: "Deposit") {
                        
                    }
                    
                    customButton(symbolImage: "dollarsign", title: "Withdraw") {
                        
                    }
                    
                    customButton(symbolImage: "qrcode", title: "QR Code") {
                        
                    }
                    
                    customButton(symbolImage: "qrcode.viewfinder", title: "Scanning") {
                        
                    }
                }
                .padding(.top, 10)
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
    
    private func customButton(symbolImage: String, title: String, onClick: @escaping() -> ()) -> some View {
        ZStack {
            Button {
                
            } label: {
                VStack(spacing: 0) {
                    Image(systemName: symbolImage)
                        .fontWeight(.semibold)
                        .foregroundColor(.red)
                        .frame(width: 35, height: 35)
                        .background {
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(.white)
                        }
                    
                    Text(title)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .lineLimit(1)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
            }

        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}

extension View {
    @ViewBuilder
    func offset(coordinateSpace: CoordinateSpace, completion: @escaping (CGFloat) -> ()) -> some View {
        self
            .overlay {
                GeometryReader { geo in
                    let minY = geo.frame(in: coordinateSpace).minY
                    Color.clear
                        .preference(key:OffsetKey.self ,value: minY)
                        .onPreferenceChange(OffsetKey.self) { value in
                            completion(value)
                        }
                }
            }
    }
}
