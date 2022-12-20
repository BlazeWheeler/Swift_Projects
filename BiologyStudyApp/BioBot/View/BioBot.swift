//
//  ContentView.swift
//  SwiftChatBot
//
//  Created by blaze Wheeler on 2/12/22.
//

import SwiftUI
import OpenAISwift

final class ViewModel: ObservableObject {
    init() {}
    
    private var client: OpenAISwift?
    
    func setup() {
        client = OpenAISwift(authToken: "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")
    }
    
    func send(text: String, completion: @escaping (String) -> Void ) {
        client?.sendCompletion(with: text, maxTokens: 500,
                               completionHandler: { result in
            switch result {
            case .success(let model):
                let output = model.choices.first?.text ?? ""
                completion(output)
            case.failure:
                break
            }
        })
    }
}


struct BioBot: View {
    
    @ObservedObject var viewModel = ViewModel()
    @State var messageText = ""
    @State var messagesModels = [String]()
    
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
            ScrollView() {
             
                ForEach(messagesModels, id: \.self) { message in
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
                
             
            
            HStack {
                TextField("Ask a biology question...", text: $messageText)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                   
                // If Textfeild is empty no message sent to ai
                Button {
        
                    send()
                    self.messageText = ""
                    
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
        // Set up ViewModel
        .onAppear(){
            viewModel.setup()
        }
    }
    
    // Send To OpenAi
    func send() {
        guard !messageText.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        messagesModels.append("[USER] \(messageText)")
        viewModel.send(text: messageText) { response in
            DispatchQueue.main.sync {
                self.messagesModels.append(response)
                self.messageText = ""
            }
        }
    }
}

struct BioBot_Previews: PreviewProvider {
    static var previews: some View {
        BioBot()
    }
}

