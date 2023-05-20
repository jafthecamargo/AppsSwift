import SwiftUI

struct ContentView: View {
    
    @State private var escuela: String = "ESCOM"
    @State private var nombre: String = ""
    @State private var apellido: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text(escuela)
                    .font(.title)
                    .fontWeight(.medium)
                
                TextField("Ingresa tu nombre", text: $nombre)
                    .padding(10)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(7)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                
                TextField("Ingresa tu apellido", text: $apellido)
                    .padding(10)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(7)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                
                NavigationLink(destination: ViewView(nombre: nombre, apellido: apellido)) {
                    Text("Aceptar") 
                        .frame(maxWidth: .infinity)
                        .padding(10)
                        .font(.headline)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(7)
                }
                
                Spacer()
                
                Text("© Jafthe Camargo")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                
                Spacer()
            }
            .navigationTitle("T4-E1")
            .padding()
        }
        .navigationViewStyle(.stack)
    }
}
