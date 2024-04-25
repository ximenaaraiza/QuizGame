//
//  Start.swift
//  quizgame
//
//  Created by StudentAM on 4/12/24.
//

import SwiftUI
//struct to store the question options and answer for each question
struct Question{
    var  question : String
    var options : [String]
    var answer : String
}
struct Start: View {
    //this will update to know which array of question options and answers to display
    @State private var index : Int = 0
    //will determine if the question was answered correctly in order to aid color change
    @State private var questionTrue : Bool = false
    // will store the answer if the answer clicked was correct
    @State private var questionCorect : String = ""
    //will store the answer if the answer clicked was incorrect
    @State private var questionIncorrect : String = ""
    //creates array of struct with the info
    @State private var questions : [Question] = [
        Question(question: "Who is Winnie the Pooh?", options:["The Tiger","The Bear","The Pig", "The Donkey"], answer: "The Bear"),
        Question(question: "Who is the most fearful?", options:["Piglet", "Winnie the Pooh", "Tigger", "Eeyore"], answer: "Piglet"),
        Question(question: "Who is super energetic?", options:["Pigelt","Winnie the Pooh","Tigger","Eeyore"], answer: "Tigger"),
        Question(question:"Who is the saddest?", options: ["Tigger","Piglet","Eeyore","Winnie the Pooh"], answer: "Eeyore"),
        Question(question: "Who is Pooh Bear's best friends?", options:["Christopher","Eeyore","Tigger","Piglet"], answer: "Piglet"),
        Question(question: "What is Winnie the Pooh's favorite food?", options:["Leaves","Honey","Berries","Peanut Butter"], answer: "Honey"),
        Question(question: "Who loses his tail?", options: ["Tigger","Piglet","Eeyore","Winnie the Pooh"], answer: "Eeyore"),
        Question(question: "What does Tigger do the best", options:["Bounce","Dance", "Sing", "Tell Jokes"], answer:"Bounce"),
        Question(question: "Who Character is Ximena's favorite?", options:["Tigger","Winnie the Pooh","Eeyore","Piglet"], answer:"Piglet")
    ]
    //will update when question is answered correctly
   @State var score : Int = 0
    var body: some View {
        NavigationView{
        ZStack{
            //background
            Image("tiger")
                .resizable()
                .frame(width:420, height:885)
                .ignoresSafeArea()
            VStack{
                //to make sure the game ends after the last question do error doesnt occur, there are only 10 questons so the game should end when it hits index 9
                if index < 9 {
                Text("Score: \(score)")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .foregroundStyle(Color.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                //will dicplay the question in whatever array of the index is being chosen
                    Text("\(questions[index].question)")
                        .frame(width:300, height:150)
                        .background(Color.white)
                        .font(.title)
                        .foregroundStyle(Color.blue)
                        .bold()
                        .cornerRadius(10)
                    //will displau all the strings in the array of the options of the struct array, all options will display
                    ForEach(questions[index].options.indices, id: \.self){i in
                        Button(action:{checkAnswer(optionClicked: questions[index].options[i])}) {
                            Text(questions[index].options[i])
                        }
                        .frame(width:250 ,height:30 )
                        .padding()
                        .foregroundStyle(Color.blue)
                        // if the optiom clicked is the same as the string in the inccorect answer then the color will turn red if not then check if the string is equal to whats stored in correct answer then color will be green if its not equal to either it will stay yellow or "Cherry"
                        .background(questions[index].options[i] == questionIncorrect ? Color.red :(questions[index].options[i] == questionCorect ? Color.green : Color("Cherry")))
                        .cornerRadius(10)
                        .bold()
                    }
                }
                //once we reach the final question which has the index of 9 then the final score and next button will be displyed
                if index == 9{
                    Text("Final Score 🍯: \(score)")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .foregroundStyle(Color("Cherry"))
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        //link to finish page
                    NavigationLink(destination: finishQuiz().navigationBarBackButtonHidden(true), label:  {
                                                  Text("Next")
                                                      .frame(width:80 , height:60)
                                                      .foregroundStyle(Color.white)
                                                      .bold()
                                                      .background(Color.pink)
                                                      .font(.system(size: 20))
                                                      .cornerRadius(10)
                                                      .padding()
                                                     
                                                  
                                              })
                }
            }
            }
            
        }
    }
    //checking is answer is right of wrong
    func checkAnswer(optionClicked : String){
        //if the string that was clicked id equal to the answer string then you add one to the score and make sure its true that it was answered correcly then make the string clicked that was correct equal the question correct
            if optionClicked == questions[index].answer{
                score += 1
                questionTrue = true
                questionCorect = optionClicked
                
            }
        //if the string didnt mtach put the string you chose in the question incorrect
            else{
                questionIncorrect = optionClicked
            }
        //delays the change half a seconf to allow users to see if it was right or wrong
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            //if the index hasnt read=ch the final index add one to update the question you are on
                if index < 9{
                    index += 1
                }
            //after this set the incorect correct back to empty to make the next question display all the buttons as yellow till you click a new answer
                questionIncorrect = ""
                questionCorect = ""
            }
            
            
        }
    }
    


#Preview {
    Start()
}
