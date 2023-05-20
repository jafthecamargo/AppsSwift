import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                GeometryReader { geometry in
                    ZStack {
                        // Dibujar los ejes X e Y
                        Path { path in
                            path.move(to: CGPoint(x: 0, y: geometry.size.height/2))
                            path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height/2))
                        }
                        .stroke(Color.gray, lineWidth: 0.5)
                        
                        Path { path in
                            path.move(to: CGPoint(x: geometry.size.width/2, y: 0))
                            path.addLine(to: CGPoint(x: geometry.size.width/2, y: geometry.size.height))
                        }
                        .stroke(Color.gray, lineWidth: 0.5)
                        
                        // Dibujar linea inclinada
                        Path { path in
                            path.move(to: CGPoint(x: geometry.size.width/5, y: geometry.size.height/4))
                            path.addLine(to: CGPoint(x: geometry.size.width/1.25, y: geometry.size.height/4))
                        }
                        .stroke(Color.accentColor, style: StrokeStyle(lineWidth: 1.5, dash: [2, 2]))
                        
                        Path { path in
                             path.move(to: CGPoint(x: geometry.size.width/5, y: geometry.size.height/2))
                            path.addLine(to: CGPoint(x: geometry.size.width/2, y: geometry.size.height/3))
                        }
                        .stroke(Color.accentColor, lineWidth: 1.5)
                        
                        Ellipse()
                            .fill(Color.accentColor.opacity(0.3))
                            .overlay(
                                Ellipse()
                                    .stroke(Color.accentColor, lineWidth: 1)
                            )
                            .frame(width: min(geometry.size.width, geometry.size.height) * 0.3, height: min(geometry.size.width, geometry.size.height) * 0.3)
                            .position(x: geometry.size.width * 0.3, y: geometry.size.height * 0.65)
                    }
                }
            }
            .navigationTitle("Ejemplo 1")
            .padding()
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ViewView2()) {
                        Image(systemName: "function")
                    }
                    NavigationLink(destination: ViewView()) {
                        Image(systemName: "number")
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}
