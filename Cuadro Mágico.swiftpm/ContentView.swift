import SwiftUI

struct ContentView: View {
    
    @State private var tamaño = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                Spacer()
                                
                Image(systemName: "table")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150, alignment: .center)
                    .foregroundColor(.accentColor)
                
                Spacer()
                    
                TextField("Ingresa un número impar para el tamaño", text: $tamaño)
                    .padding(10)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(7)
                    .font(.headline)
                    .keyboardType(.numberPad)
                    .frame(maxWidth: .infinity)
                
                NavigationLink(destination: CuadroMagicoView(tamaño: tamaño)) {
                    Text("Aceptar") 
                        .frame(maxWidth: .infinity)
                        .padding(10)
                        .font(.headline)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(7)
                        .hoverEffect(.automatic)
                }
                
                Spacer()
                
                Text("© Jafthe Camargo")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                
                Spacer()
            }
            .navigationTitle("Cuadro Mágico")
            .padding()
        }
        .navigationViewStyle(.stack)
    }
}
