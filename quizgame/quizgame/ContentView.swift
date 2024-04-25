//
//  ContentView.swift
//  quizgame
//
//  Created by StudentAM on 4/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            //nav view so we can use nav links
            ZStack{
                //so image can be added as a background
                Image("babyAnimals")
                    .resizable()
                    .frame(width:450, height:877)
                VStack {
                    //vstack to organize things vertically
                //text that says quiz
                    Text("Quiz Time!!")
                        .frame(width: 250, height:100)
                        .bold()
                        .foregroundStyle(Color.blue)
                        .font(.system(size: 40))
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .background(Color("Cherry"))
                        .cornerRadius(10)
                    //takes you to the page where quiz is played
                    NavigationLink(destination: Start().navigationBarBackButtonHidden(true) , label:{
                        Text("Begin")
                            .frame(width:200 , height:60)
                            .foregroundStyle(Color.white)
                            .bold()
                            .background(Color.pink)
                            .font(.system(size: 25))
                            .cornerRadius(10)
                            .padding(80)
                    })
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
