//
// Calc++
//  CalcView.swift
//  CalcApp
//  Created by Blaze Wheeler  on 11/1/22.
//  See the License.txt file for this sample’s licensing information.
//

import SwiftUI
import LocalAuthentication



// Create Buttons
enum CalcButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case mutiply = "x"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "-/+"
    
    // Duquense Colors
    var buttonColor: Color{
        switch self {
        case .add, .subtract, . mutiply, .equal, .percent:
            return .gray
        case .clear, .negative, .divide:
            return .orange
        default:
            // navy
            return Color(.systemGray3)
        }
    }
}

enum Operation {
    
    // add case for percent
    case add, subtract, multiply, divide, percent, negative, none
}


struct CalcView: View {
    // navagaiton to test
    @AppStorage("pass") var password = ""
    @AppStorage("FirstStart") var alertShouldBeShown = true
    
    @State var presentAlert = true
    @State var unlocked = false
    @State var navigated = false
    
    //Calculator Variables
    @State var value = "0"
    @State var runningNumber = 0.0
    @State var currentOperation : Operation = .none
    
    // Create Passwork Var
    // Retrive from alert
    
    
    let buttons: [[CalcButton]] = [
    
        [.clear, .negative, .divide, .percent],
        [.seven, .eight, .nine, .mutiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal],
    ]
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                    //MARK: Password length
                    if(password.count < 5){
                        // Default
                        Text("Hello World!")
                        // Pasword Set Alert
                            .alert("Set Pin", isPresented: $presentAlert, actions: {
                                SecureField("Password", text: $password)
                                    .keyboardType(.numberPad)
                                Button("Save", action: {
                                    UserDefaults.standard.set(false, forKey: "SetPassword")
                    
                                    if(password.isEmpty){
                                        presentAlert = false
                                    }
                                })
                            }, message: {
                                Text("Enter 5 digit numeric pin \n(This can NOT be changed)" +
                                     "\n(To access photo vault enter pin # followed by " +  "%")
                            })
                    }
                // Calculator User InterFace
                Color.black.edgesIgnoringSafeArea(.all)
                ZStack(alignment: .topLeading) {
                    Color.clear
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Text(value)
                            .bold()
                            .font(.system(size: 100))
                            .foregroundColor(.white)
                            .lineLimit(1)
                    }
                    .padding()
                    
                    ForEach(buttons, id: \.self) { row in
                        HStack(spacing: 12) {
                            
                            ForEach(row, id: \.self) { item in
                                
                                Button(action: {
                                    self.didTap(button: item)
                                    
                                }, label:  {
                                    Text(item.rawValue)
                                        .font(.system(size: 32))
                                        .frame(width: self.buttonWidth(item: item),
                                               height:self.buttonHeight()
                                        )
                                    
                                        .background(item.buttonColor)
                                    
                                        .foregroundColor(.white)
                                        .cornerRadius(self.buttonWidth(item: item) / 2)
                                })
                            }
                        }
                        .padding(.bottom, 3)
                    }
                }
                 // Switch Views -> Deperciated
                
                 NavigationLink(destination: GridView(), isActive: $navigated) {
                 EmptyView()
            }
        }
    }
}
    func didTap(button: CalcButton) {
        switch button {
       
            // MARK: create case for percent

            
        case .add, .subtract, .mutiply, .divide, .equal , .negative, .percent:
            if button == .add {
                self.currentOperation = .add
                self.runningNumber = Double(self.value) ?? 0.0
               
            } else if button == .negative {
                self.currentOperation = .negative
                self.runningNumber = Double(self.value) ?? 0.0
            }
            
            else if button == .subtract {
                self.currentOperation = .subtract
                self.runningNumber = Double(self.value) ?? 0.0
                
            }  else if button == .mutiply {
                self.currentOperation = .multiply
                self.runningNumber = Double(self.value) ?? 0.0
                
            } else if button == .divide {
                self.currentOperation = .divide
                self.runningNumber = Double(self.value) ?? 0.0
             
                // add more functions
                
            } else if button == .percent {
                self.currentOperation = .percent
                self.runningNumber = Double(self.value) ?? 0.0
            
                // Navagation checking
                if value == password {
                   // face id and touch id
                    authenticate()
                }
            }
            
            else if button == .equal {
                let runningValue = self.runningNumber
                let currentValue = Double(self.value) ?? 0.0
                
                // TODO: Create Decimal Else If
                switch self.currentOperation {
                case .add: self.value = "\(runningValue + currentValue)"
                case .negative: self.value = "\(runningValue - (runningNumber * 2))"
                case .subtract: self.value = "\(runningValue - currentValue)"
                case .multiply: self.value = "\(runningValue * currentValue)"
                case .divide: self.value = "\(runningValue / currentValue)"
                // add percent button (Secrect)
                case .percent: self.value = "\(runningValue * 0.01)"
                    
                case .none:
                    break
                }
            }
            
            if button != .equal {
                self.value = "0"
            }
            
            if button == .negative {
                self.value = "\(runningNumber - (runningNumber * 2))"
            }
            if button == .percent {
                self.value = "\( runningNumber * 0.01)"
            }
            
        case .clear:
            self.value = "0"
            // had percent
        case .decimal:
            break
        default:
            let number = button.rawValue
            if self.value == "0" {
                value = number
            } else {
                self.value = "\(self.value)\(number)"
            }
        }
    }
    
    func buttonWidth(item: CalcButton) -> CGFloat {
        if item == .zero {
            return ((UIScreen.main.bounds.width - 4 * 12) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if (context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Unlock Secure Data"){ success, authenticationError in
                if success {
                    self.navigated = true
                }
                // No Biometric Sucess
                else {
                    self.navigated = false
                }
            }
        // Phone Does Not Have BioMetrics
        } else {
            self.navigated = false
        }
    }
}

struct CalcView_Previews: PreviewProvider {
    static var previews: some View {
        CalcView()
    }
}


