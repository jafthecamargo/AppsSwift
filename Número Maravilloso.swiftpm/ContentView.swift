import SwiftUI

struct ContentView: View {
    
    @State private var txt = ""
    @State private var num = 0
    @State private var resultado = ""
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Image(systemName: "number.square.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150, alignment: .center)
                    .foregroundColor(.accentColor)
                
                Spacer()
                
                TextField("Ingresa un número natural", text: $txt)
                    .padding(10)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(7)
                    .font(.headline)
                    .keyboardType(.numberPad)
                    .frame(maxWidth: .infinity)
                
                Button("Calcular") {
                    if showAlert == false {
                        resultado = ""
                    }
                    let n = Int(txt) 
                    nm(num: n ?? 0)
                }
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .font(.headline)
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(7)
                
                Spacer()
                
                Text("© Jafthe Camargo")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Número Maravilloso")
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Resultado"), message: Text("\(resultado)"), dismissButton: .default(Text("Aceptar")))
            }
        }
        .navigationViewStyle(.stack)
    }
    
    func nm(num: Int) {
        var n = Int(num)
        resultado += "\n\(String(n))"
        print(n)
        if n % 2 == 0 {
            n = n / 2
            if n != 1 {
                nm(num: n)
            } else {
                resultado += "\n1\n\nEs un número maravilloso"
                print("1\nEs un número maravilloso")
            }
        } else {
            n = n * 3 + 1
            if n != 1 {
                nm(num: n)
            }
            else {
                resultado += "\n1\n\nEs un número maravilloso"
                print("1\nEs un número maravilloso")
            }
        }
        showAlert = true
    }
}
