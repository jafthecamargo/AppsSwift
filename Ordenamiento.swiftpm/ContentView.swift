import SwiftUI

struct ContentView: View {
    
    @State private var text = ["","","",""]
    @State private var num = [Int]()
    @State private var M = [Int]()
    @State private var m = [Int]()
    @State private var num1 = 0
    @State private var num2 = 0
    @State private var resta = ""
    @State private var uno = 0
    @State private var dos = 0
    @State private var tres = 0
    @State private var cuatro = 0
    @State private var ordenar = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Introduce cuatro números")
                    
                    HStack {
                        TextField("1", text: $text[0])
                            .padding(10)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(7)
                            .font(.headline)
                            .keyboardType(.numberPad)
                            .frame(maxWidth: .infinity)
                        TextField("2", text: $text[1])
                            .padding(10)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(7)
                            .font(.headline)
                            .keyboardType(.numberPad)
                            .frame(maxWidth: .infinity)
                        TextField("3", text: $text[2])
                            .padding(10)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(7)
                            .font(.headline)
                            .keyboardType(.numberPad)
                            .frame(maxWidth: .infinity)
                        TextField("4", text: $text[3])
                            .padding(10)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(7)
                            .font(.headline)
                            .keyboardType(.numberPad)
                            .frame(maxWidth: .infinity)
                    }
                    
                    Button("Ordenar") {
                        withAnimation {
                            ordenar = true
                        }
                        num = [Int]()
                        uno = Int(text[0]) ?? 0
                        num.append(uno)
                        dos = Int(text[1]) ?? 0
                        num.append(dos)
                        tres = Int(text[2]) ?? 0
                        num.append(tres)
                        cuatro = Int(text[3]) ?? 0
                        num.append(cuatro)
                        m = num.sorted()
                        M = m.reversed()
                        num1 = Int(m.map(String.init).joined(separator: "")) ?? 0
                        num2 = Int(M.map(String.init).joined(separator: "")) ?? 0
                        resta = String(num2-num1)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .font(.headline)
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(7)
                }
                
                if ordenar {
                    Spacer()
                    
                    Text("[ " + M.map(String.init)
                        .joined(separator: ", ") + " ]")
                    Text("[ " + m.map(String.init)
                        .joined(separator: ", ") + " ]")
                    
                    Spacer()
                    
                    Text(resta)
                }
                
                Spacer()
                
                Text("© Jafthe Camargo")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                
                Spacer()
            }
            .navigationTitle("Ordenamiento")
            .padding()
        }
        .navigationViewStyle(.stack)
    }
}
