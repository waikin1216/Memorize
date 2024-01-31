//
//  ContentView.swift
//  Memorize
//
//  Created by Wai Kin Ng on 29/1/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            let emojis:[String] = ["👻","♦️","♠️","❤️","👻"]
//            ForEach(0..<4, id:\.self){index in
//                CardView(content:emojis[index],isFaceUp: true)
//            }
            ForEach(emojis.indices, id:\.self){ index in
                CardView(content:emojis[index],isFaceUp: true)
            }
        }
        
        
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView : View {
    let content:String
    @State var isFaceUp : Bool = true
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                base.fill(.white)
                    
                base.strokeBorder(lineWidth: 2)
              Text(content)
                    .font(.largeTitle)
            }else{
                base.fill()
                    .foregroundColor(.green)
            }
            
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
