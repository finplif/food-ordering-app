//
//  OffsetModifier.swift
//  Gyros47
//
//  Created by finplif on 8/15/22.
//

import Foundation
import SwiftUI

struct OffsetModifier: ViewModifier {
    let option: CategoryBar_M
    
    @Binding var CurrentOption: CategoryBar_M
    
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader {proxy in
                    Color.clear
                        .preference(key: OffsetKey.self, value: proxy.frame(in: .named("scroll")))
                }
            )
            .onPreferenceChange(OffsetKey.self) { proxy in
                let offset = proxy.minY
                withAnimation{
                    CurrentOption = (offset < 20 && -offset < (proxy.midX / 2) && CurrentOption != option ) ?
                    option : CurrentOption
                }
                print(offset)
            }
    }
}

