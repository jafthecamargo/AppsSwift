import SwiftUI

struct ViewView: View {
    
    var nombre: String
    var apellido: String
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Hola " + nombre + " " + apellido)
                    .font(.title)
                    .fontWeight(.medium)
                
                Spacer()
                
                Text("© Jafthe Camargo")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                
                Spacer()
            }
            .padding()
        }
        .navigationViewStyle(.stack)
    }
}
