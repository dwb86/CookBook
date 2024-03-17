//
//  FetchRecipeView.swift
//  RecipeBook
//
//  Created by Dylan Benavides on 1/21/24.
//

import SwiftUI

struct ThemeView<TestView:View>: View {
    
    @Environment(\.managedObjectContext) var context
    var ContentView:() -> TestView
    let darkBlue = Color(red: 0.06666666666666667, green: 0.0, blue: 0.3496078431372549)
    
    init(@ViewBuilder ContentView: @escaping () -> TestView) {
        self.ContentView = ContentView
    }
    var body: some View {
        
        NavigationStack{
            ScrollView{
                ZStack{
                    VStack{
                        Spacer().frame(height: 20)
                        HStack{
                            Spacer().frame(width: 20)
                            VStack{
                                Spacer().frame(height: 100)
                                ContentView()
                                Spacer()
                            }.frame(minWidth: 350, maxWidth: .infinity, minHeight: 500,maxHeight: .infinity)
                                .background(.white)
                                .cornerRadius(15)
                            Spacer().frame(width: 20)
                        }
                        Text("Powered by\nDylan's Big Brain")
                            .frame(width: 150,height: 50)
                            .multilineTextAlignment(.center)
                            .colorScheme(.dark)
                        Spacer().frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    }
                }.background(darkBlue)
            }.frame(maxWidth: .infinity)
                .background(darkBlue)
        }
        
    }
    
}

extension View {
    @available(iOS 14, *)
    func navigationBarTitleTextColor(_ color: Color) -> some View {
        let uiColor = UIColor(color)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor ]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor ]
        return self
    }
}

//#Preview {
//    ThemeView(ContentView: {GetRecipeBarView()})
//}
