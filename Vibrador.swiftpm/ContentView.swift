import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State private var inputText = ""
    @State private var morseCode = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                TextField("Ingresar datos", text: $inputText)
                    .padding(10)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(7)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                
                Button(action: {
                    morseCode = translateToMorseCode(inputText)
                    vibratePhone(morseCode)
                }) {
                    Text("Aceptar")
                        .frame(maxWidth: .infinity)
                        .padding(10)
                        .font(.headline)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(7)
                }
                Spacer()
                Text("Código Morse: \(morseCode)")
                    .font(.headline)
                Spacer()
            }
            .padding()
            .navigationTitle("Vibrador")
            .onTapGesture {
                hideKeyboard()
            }
        }
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func translateToMorseCode(_ text: String) -> String {
        let morseCodeDictionary: [Character: String] = [
            "A": ".-", "B": "-...", "C": "-.-.", "D": "-..", "E": ".", "F": "..-.", "G": "--.", "H": "....",
            "I": "..", "J": ".---", "K": "-.-", "L": ".-..", "M": "--", "N": "-.", "O": "---", "P": ".--.",
            "Q": "--.-", "R": ".-.", "S": "...", "T": "-", "U": "..-", "V": "...-", "W": ".--", "X": "-..-",
            "Y": "-.--", "Z": "--..", "0": "-----", "1": ".----", "2": "..---", "3": "...--", "4": "....-",
            "5": ".....", "6": "-....", "7": "--...", "8": "---..", "9": "----."
        ]
            
        let uppercasedText = text.uppercased()
        var morseCode = ""
            
        for character in uppercasedText {
            if let morseChar = morseCodeDictionary[character] {
                morseCode += morseChar + " "
            } else if character == " " {
                morseCode += "/ "
            }
        }
            
        return morseCode
    }
        
    func vibratePhone(_ morseCode: String) {
        let unitDuration = 0.2 // Duración base de la vibración
        
        DispatchQueue.global(qos: .background).async {
            for character in morseCode {
                switch character {
                case ".":
                    self.vibrate(duration: unitDuration)
                    Thread.sleep(forTimeInterval: unitDuration)
                case "-":
                    self.vibrate(duration: unitDuration * 3)
                    Thread.sleep(forTimeInterval: unitDuration)
                case " ":
                    Thread.sleep(forTimeInterval: unitDuration * 3)
                case "/":
                    Thread.sleep(forTimeInterval: unitDuration * 7)
                default:
                    break
                }
            }
        }
    }
        
    func vibrate(duration: TimeInterval) {
        DispatchQueue.main.async {
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
        }
        Thread.sleep(forTimeInterval: duration)
    }
}
