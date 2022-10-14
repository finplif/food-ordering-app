//
//  AllFood_V.swift
//  Gyros47
//
//  Created by finplif on 8/15/22.
//

import SwiftUI

struct AllFood_V: View {
//    let option: CategoryBarModal
    @State var quantity = 1
    @State var quantityprice = 0
    @State var card : AllFood_M
    @State var hero : Bool
    @State var non : Array<String> = []
    @State var noneed : Array<String> = []
//    @State var heart = "heart.fill"
    
    @Environment (\.presentationMode) var presentationMode
    
    @EnvironmentObject var cartViewModal: Cart_VM
    @EnvironmentObject var ingredientsViewModal: Ingredients_VM

    var body: some View {
        VStack {
            ZStack {
                VStack {
                    HStack {
                        Spacer()
                        Button(
                            action: {
                                self.hero.toggle()
                                presentationMode.wrappedValue.dismiss()
                            },
                            label: {
                                Image(systemName: "xmark")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.black.opacity(0.8))
                                    .clipShape(Circle())
                            })
                        .padding(.top, -40.0)
                        .padding(.bottom, 10.0)
                    }
                    .navigationBarHidden(true)
                    .padding(.trailing, self.card.expand ? 10 : 15)
                }
            }
            .edgesIgnoringSafeArea(.top)

            VStack{
                HStack {
                    Text(card.title)
                        .font(.title.bold())
                        .padding(.top, 10)

                    Spacer()
                }
                .padding(.bottom, 20)

//                HStack {
//                    ForEach(0 ..< card.stars, id:\.self) { item in
//                        Image(systemName: "star.fill")
//                            .foregroundColor(.yellow)
//                            .font(.subheadline)
//                    }
//                    ForEach(card.stars ..< 5, id:\.self) { item in
//                        Image(systemName: "star.fill")
//                            .foregroundColor(Color(#colorLiteral(red: 0.9580881, green: 0.10593573, blue: 0.3403331637, alpha: 1)))
//                            .font(.subheadline)
//                    }
//
//                    Spacer()
//
//                    Text(String(card.price)+"$")
//                        .font(.subheadline)
//                        .bold()
//                }

                VStack(alignment: .leading){
                    HStack {
                        Text("Description")
                            .font(.title2)
                            .bold()

                        Spacer()
//                            Button(
//                                action: {
//                                    withAnimation(.spring(dampingFraction: 0.5)) {
//                                        heart = "heart"
//                                    }
//                                },
//                                label: {
//                                    Image(systemName: heart)
//                                        .font(.title)
//                                        .foregroundColor(.red)
//                                })
                    }
                    .padding(.vertical, 5)

                    Text(card.descrip)
                        .padding(.bottom, 5)
                }

                Divider()
                
                VStack(alignment: .leading){
                    HStack{
                        Text("Ingredients")
                            .font(.title2)
                            .bold()

                        Spacer()
                    }

                    VStack {
                        ForEach(card.ingredients) {ingredient in
                            Ingredients_V(item: ingredient, noneed: $non)
                        }
                    }
                }
                .padding(.horizontal)
                .frame(width: 390)

                Divider()
                
                VStack{
                    HStack {
                        Text("Quantity ")
                            .bold()
                        if (quantity > 1) {
                            Text("\(quantity)")
                                .bold()
                        }
                        Spacer()
                        Stepper("", value: $quantity, in: 1...100)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .frame(width: 100)
                    }

                    HStack {
                        Text("Price")
                            .bold()
                        Spacer()
                        Text("\(numberformatter(value: card.price * Double(quantity)) ?? "")")
                                .bold()
                    }

                    Button(
                        action: cartButtonPressed,
                        label: {
                            Text("Add to Cart")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 100)
                                .background(Color.red)
                                .cornerRadius(10)
                        })
                    .padding(.top, 10)
                }
            }
            .padding(.horizontal)
        }
    }


    
    func cartButtonPressed(){
        var counts: [String: Int] = [:]

        for item in non {
            counts[item] = (counts[item] ?? 0) + 1
        }

        for (key, value) in counts {
            if ((counts[key] ?? 0) % 2 == 1) {
                noneed.append("no \(key)")
            }
            print("\(key) occurs \(value) time(s)")
        }
        
        cartViewModal.addItem(
            title: card.title,
            category: card.category,
            description: card.descrip,
            ingredients: noneed,
            price: card.price * Double(quantity),
            quantity: Int(quantity))
        presentationMode.wrappedValue.dismiss()
    }

    func numberformatter(value: Double) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        guard let numberString = formatter.string(from: NSNumber(value: value)) else { return "-" }
        return numberString
    }
}

struct AllFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AllFood_V(card: ItalianBeefFood[3], hero: true)
        .environmentObject(Ingredients_VM())
        .environmentObject(Cart_VM())
    }
}

