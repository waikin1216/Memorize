//
//  ContentView.swift
//  Memorize
//
//  Created by Wai Kin Ng on 29/1/2024.
//

import SwiftUI

struct ContentView: View {
    @State var cardCount : Int = 4
    let emojis:[String] = ["👻","♦️","♠️","❤️","👻","💩","🎃","🤖","👽","👾","👹","🌚","🌝","🤡"]
    var body: some View {
        VStack{
            ScrollView{
                card
            }
            Spacer()
            cardCoundAdjusters
        }
        .padding()
    }
    
    var cardCoundAdjusters : some View{
        HStack{
            cardAdder
            Spacer()
            cardRemover
        }
    }
    
    var card : some View{
//        let columns : [GridItem]=[GridItem(.adaptive(minimum:65)),
//                                  GridItem(.adaptive(minimum:65)),
//                                  GridItem(.adaptive(minimum:65))]
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
//            ForEach(0..<4, id:\.self){index in
//                CardView(content:emojis[index],isFaceUp: true)
//            }
            ForEach(0..<cardCount, id:\.self){ index in
                CardView(content:emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
            
        }
        .foregroundColor(.orange)
    }
    
    func cardCountAdjuster(by offset: Int, symbol:String) -> some View{
        Button(action:{
                cardCount += offset
        },label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset > emojis.count || cardCount + offset < 1)
    }
    var cardRemover:some View{
        cardCountAdjuster(by: -1, symbol: "minus.circle")
    }
    
    var cardAdder : some View{
        cardCountAdjuster(by: 1, symbol: "plus.circle")
    }
}

struct CardView : View {
    let content:String
    @State var isFaceUp : Bool = true
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.fill(.white)
                    
                base.strokeBorder(lineWidth: 2)
              Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            
            }
            
        .onTapGesture {
//            isFaceUp = !isFaceUp
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
