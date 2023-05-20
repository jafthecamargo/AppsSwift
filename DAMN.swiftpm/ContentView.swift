import SwiftUI

struct ContentView: View {
    
    @State private var escuela: String = "ESCOM"
    @State private var datos: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text(escuela)
                    .font(.title)
                    .fontWeight(.medium)
                
                TextField("Ingresar datos", text: $datos)
                    .padding(10)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(7)
                    .font(.headline)
                    .keyboardType(.numberPad)
                    .frame(maxWidth: .infinity)
                
                Button("Aceptar") {
                    datos = "Viva México!!!"
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
            .navigationTitle("DAMN")
            .padding()
        }
        .navigationViewStyle(.stack)
    }
}
