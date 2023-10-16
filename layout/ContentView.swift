//
//  ContentView.swift
//  layout
//
//  Created by oiu on 16.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var yes: Bool = false
    let rectangleCount: Int = 6
    
    var body: some View {
        let layout = yes ? AnyLayout(VStackLayout(spacing: 0)) : AnyLayout(HStackLayout(spacing: 5))
        
        layout {
            Group {
                ForEach(0..<rectangleCount) { index in
                    RoundedRectangle(cornerRadius: 5)
                        .aspectRatio(1.0, contentMode: .fit)
                        .foregroundColor(Color.blue)
                        .alignmentGuide(HorizontalAlignment.center) { guide in
                            let w = UIScreen.main.bounds.width - guide.width
                            
                            return w / CGFloat(rectangleCount - 1) * CGFloat(index)
                        }
                        .onTapGesture {
                            withAnimation {
                                yes.toggle()
                            }
                        }
                }
            }
        }
        .environment(\.layoutDirection, !yes ? .rightToLeft : .leftToRight)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
