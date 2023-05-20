import SwiftUI

struct ContentView: View {
    
    @State var pixelPosition: CGPoint = CGPoint(x: 50, y: 50)
    @State var pixelColor = Color.accentColor
    @State private var mover = false
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    GeometryReader { geometry in
                        VStack {
                            HStack {
                                // Pintar un pixel rojo
                                Rectangle()
                                    .fill(pixelColor)
                                    .frame(width: 10, height: 10)
                                    .position(pixelPosition)
                            }
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    }
                }
                
                Spacer()
                
                Button("Mover") {
                    
                    self.mover.toggle()
                    
                    if mover == true {
                        withAnimation {
                            // Actualizar la posición del píxel
                            pixelPosition = CGPoint(x: 300, y: 300)
                            pixelColor = Color.blue
                        }
                    }
                    if mover == false {
                        withAnimation {
                            // Actualizar la posición del píxel
                            pixelPosition = CGPoint(x: 50, y: 50)
                            pixelColor = Color.accentColor
                        }
                    }
                    
                }                
                .frame(maxWidth: .infinity)
                .padding(10)
                .font(.headline)
                .background(Color.accentColor)
                .foregroundColor(.white)
                .cornerRadius(7)
            }
            .navigationTitle("Draw")
            .padding()
        }
        .navigationViewStyle(.stack)
    }
}
