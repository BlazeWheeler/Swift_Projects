//
//  GameView.swift
//  Tic-Tac-Toe
//
import SwiftUI

struct GameView: View {
   
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack{
                
                NavigationView { // <1>

                    LazyVGrid(columns: viewModel.columns, spacing: 5){
                        ForEach(0..<9){ i in
                            ZStack{
                                GameSquareView(proxy: geometry)
                                PlayerIndicator(systemImageName: viewModel.moves[i]?.indicator ?? "")
                            }
                            
                            .onTapGesture {
                                viewModel.ProcessPlayerMove(for: i)
                            }
                        }
                    }
                    .navigationBarTitleDisplayMode(.automatic)
                        .toolbar {
                            ToolbarItem(placement: .automatic) {
                                VStack {
                                    Text("Developed By:").font(.headline)
                                    Text("Blaze Wheeler").font(.subheadline)
                                        
                                }
                            }
                        }
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    
                }
                Spacer()
               
                Spacer()
            }
            .disabled(viewModel.isGameBoardDisabled)
            .padding()
            .alert(item: $viewModel.alertItem, content: {alertItem in
                Alert(title: alertItem.Title,
                      message: alertItem.Message,
                      dismissButton: .default(alertItem.buttonTitle, action: {viewModel.resetGame()}))
                })
            }
        }
}

enum Player{
    case human, computer
}

struct Move{
    let player : Player
    let boardIndex: Int
    var indicator: String{
        return player == .human ? "xmark" : "circle"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

struct GameSquareView: View {
    var proxy: GeometryProxy
    var body: some View {
        Rectangle()
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).opacity(0.5)
            .frame(width:proxy.size.width/3 - 15 , height:proxy.size.width/3 - 15)
    }
}

struct PlayerIndicator: View {
    var  systemImageName: String
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .frame(width:40, height: 40)
            .foregroundColor(.white)
    }
}
