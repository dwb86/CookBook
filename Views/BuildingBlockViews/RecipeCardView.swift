//
//  RecipeCardView.swift
//  CookBook
//
//  Created by Dylan Benavides on 3/23/24.
//

import SwiftUI

struct RecipeCardView: View {
    var name:String
    var picture:Image = Image("imageNA")
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                VStack{
                    picture
                        .resizable()
                        .frame(width: 100,height: 100)
                    Text(name)
                }.aspectRatio(1,contentMode: .fit)
            }
        }
    }
}


#Preview {
    RecipeCardView(name: "hello")
}
