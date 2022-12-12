//
//  ContentView.swift
//  SwiftChatBot
//
//  Created by blaze Wheeler on 2/12/22.
//

import SwiftUI

struct BioBot: View {
    @State private var messageText = ""
    @State var messages: [String] = ["Welcome To Bio Bot "]
    
    var body: some View {
        VStack {
            HStack {
                Text("BioBot")
                    .font(.largeTitle)
                    .bold()
                    
                
                Image("robot.SFSymbol" )
                    .font(.system(size: 45))
                    .foregroundColor(Color(.systemPink))
            }
            ScrollView {
                
                ForEach(messages, id: \.self) { message in
                    if message.contains("[USER]") {
                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                        HStack {
                            Spacer()
                            Text(newMessage)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color(.systemPink).opacity(0.8))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                        }
                    } else {
                        HStack {
                            Text(message)
                                .padding()
                              
                                .background(Color(.systemGray2).opacity(0.20))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                            Spacer()
                        }
                    }
                    // Messages Load From Bottom
                }.rotationEffect(.degrees(180))
                    // Flip Message To Normal
            }.rotationEffect(.degrees(180))
                .background(Color.gray.opacity(0.10))
            
            HStack {
                TextField("Ask a question...", text: $messageText)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .onSubmit {
                        
                        if(messageText.isEmpty != true ){
                            sendMessage(message: messageText)
                        }
                       
                    }
                    
                // If Textfeild is empty no message sent to ai
                Button {
                    if(messageText.isEmpty != true ){
                        sendMessage(message: messageText)
                    }
                
                    
                } label: {
                    Image("influencer.SFSymbol")
                       
                }
                .font(.system(size: 45))
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
                .foregroundColor(Color(.systemPink))
            }
            
            .padding()
            Divider()
            Spacer()
            
        
        }
        .background(Color("ColorBG1"))
        
    }
    func sendMessage(message: String){
        withAnimation{
            messages.append("[USER]" + message)
            self.messageText = ""
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            withAnimation {
                messages.append(getBotResponse(message: message))
            }
        }
    }
}

struct BioBot_Previews: PreviewProvider {
    static var previews: some View {
        BioBot()
    }
}

