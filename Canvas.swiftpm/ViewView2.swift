import SwiftUI
import UIKit
    
struct ViewView2: View {
    
    @State var amplitude: Double = 0.1 // amplitud predeterminada
    @State var period: Double = 50 // periodo predeterminado
    
    var body: some View {
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
                    
                    Text("0,0")
                        .foregroundColor(.gray)
                        .position(x: geometry.size.width/2 + 15, y: geometry.size.height/2 + 15)
                    
                    // Calcular y dibujar la función seno
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: geometry.size.height/2))
                        for x in stride(from: 0, through: geometry.size.width, by: 5) {
                            let y = sin(Double(x) * 2.0 * .pi / period) * amplitude * Double(geometry.size.height) * 0.5 + Double(geometry.size.height) * 0.5
                            path.addLine(to: CGPoint(x: x, y: y))
                        }
                    }
                    .stroke(Color.blue, lineWidth: 1.5)
                    
                    // Calcular y dibujar la función coseno
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: geometry.size.height/2))
                        for x in stride(from: 0, through: geometry.size.width, by: 5) {
                            let y = cos(Double(x) * 2.0 * .pi / period) * amplitude * Double(geometry.size.height) * 0.5 + Double(geometry.size.height) * 0.5
                            path.addLine(to: CGPoint(x: x, y: y))
                        }
                    }
                    .stroke(Color.red, lineWidth: 1.5) 
                }
            }
            Form {
                Section(header: Text("Amplitud: \(String(format: "%.2f", amplitude))")) {
                    Slider(value: $amplitude, in: 0...1, step: 0.01)
                }
                Section(header: Text("Periodo: \(String(format: "%0.f", period))")) {
                    Slider(value: $period, in: 1...500, step: 1)
                }
            }
            .frame(height: 200)
        }
        .navigationTitle("Ejercicio")
        .toolbar {
            Text("SenA")
                .foregroundColor(.blue)
            Text("CosA")
                .foregroundColor(.red)
        }
    }
}
