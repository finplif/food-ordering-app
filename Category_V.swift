//
//  Category_V.swift
//  Gyros47
//
//  Created by finplif on 8/15/22.
//

import SwiftUI

struct Category_V: View {
    let option: CategoryBar_M
    
    @State var showsheet: Bool = false
    
    @Binding var CurrentOption: CategoryBar_M
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24){
            Text(option.title)
                .font(.title.bold())
                .padding(.vertical)
            
            ForEach(option.allfooditems) {card in
                HStack(spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(card.title)
                            .font(.title3.bold())
                        
                        Text(card.descrip)
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Text("\(numberformatter(value: card.price))")
                    }
                    
                    Spacer()
//                    Image(systemName: "plus.circle.fill")
//                        .onTapGesture(perform: {showsheet.toggle()})
//                        .sheet(isPresented: $showsheet, content: {
//                            Text("hello \(card.title)")
//                        })
                    
                    NavigationLink(
                        destination: AllFood_V(card: card, hero: true),
                        label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 23, height: 23)
                            
                        })
                    .buttonStyle(PlainButtonStyle())
                    
//                    Image(card.image)
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 96, height: 88)
//                        .clipped()
//                        .cornerRadius(10)
                }
                
                Divider()
            }
        }
        .padding(.horizontal)
        .modifier(OffsetModifier(option: option, CurrentOption: $CurrentOption))
    }
    
    func numberformatter(value: Double) -> String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        guard let numberString = formatter.string(from: NSNumber(value: value)) else { return "-" }
        return numberString
    }
}

//struct CategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryView(option: .ItalianBeef, CurrentOption: $CurrentOption)
//    }
//}
