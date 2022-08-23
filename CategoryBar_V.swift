//
//  CategoryBar_V.swift
//  Gyros47
//
//  Created by finplif on 8/15/22.
//

import SwiftUI

struct CategoryBar_V: View {
    @Binding var SelectedOption: CategoryBar_M
    @Binding var CurrentOption: CategoryBar_M
    
    var body: some View {
        ScrollViewReader {proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(CategoryBar_M.allCases, id: \.self) {item in
                        VStack {
                            Text(item.title)
                                .foregroundColor(item == CurrentOption ? .black : .gray)
                            
                            if CurrentOption == item {
                                Capsule()
                                    .fill(.black)
                                    .frame(height: 3)
                                    .padding(.horizontal, -10)
                            } else {
                                Capsule()
                                    .fill(.clear)
                                    .frame(height: 3)
                                    .padding(.horizontal, -10)
                            }
                        }
                        .onTapGesture {
//                            withAnimation(.easeInOut){
//
//                            }
                            self.SelectedOption = item
                            proxy.scrollTo(item, anchor: .topTrailing)
                        }
                    }
                    .padding(.leading, 23)
                    .onChange(of: CurrentOption) {_ in
                        proxy.scrollTo(CurrentOption, anchor: .topTrailing)
                        
                    }
                }
            }
        }
        
    }
}

//struct CategoryBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryBarView(SelectedOption: .constant(.ItalianBeef), CurrentOption: )
//    }
//}
