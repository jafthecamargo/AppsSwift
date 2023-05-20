import SwiftUI

struct ContentView: View {
    
    @State private var isChecked : Bool = false
    @State private var datos = ""
    
    func toggle(){isChecked = !isChecked}
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                                
                Image(systemName: "clock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150, alignment: .center)
                    .foregroundColor(.accentColor)
                
                Spacer()
                
                HStack {
                    Button(action: toggle) {
                        Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    }
                    Text("Un CheckBox")
                }
                
                Spacer()
                    
                Button("Un Botón") {
                    print("Hola Mundo")
                }
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .font(.headline)
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(7)
                    .hoverEffect(.automatic)
                    
                Spacer()
                
                Text("© Jafthe Camargo")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                
                Spacer()
            }
            .navigationTitle("Plantilla")
            .padding()
        }
        .navigationViewStyle(.stack)
    }
}
