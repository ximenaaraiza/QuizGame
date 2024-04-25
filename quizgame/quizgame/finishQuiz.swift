//
//  finishQuiz.swift
//  quizgame
//
//  Created by StudentAM on 4/23/24.
//

import SwiftUI

struct finishQuiz: View {
    var body: some View {
        ZStack{
            //background
            Image("tiger")
                .resizable()
                .frame(width:420, height:885)
                .ignoresSafeArea()
            VStack{
                            Text("🍯")
                                .font(.system(size: 130))
                            Text("Good Job Honey !!")
                    .foregroundStyle(Color("Cherry"))
                                .font(.system(size: 40))
                                .bold()
                            //When clicked will lead back to after start to play game again
                            NavigationLink(destination: Start().navigationBarBackButtonHidden(true), label:  {
                                Text("Play Again ")
                                    .frame(width:160 , height:60)
                                    .foregroundStyle(Color.white)
                                    .bold()
                                    .background(Color.pink)
                                    .font(.system(size: 25))
                                    .cornerRadius(10)
                                    
                            })
                        }
        }
    }
}
#Preview {
    finishQuiz()
}
