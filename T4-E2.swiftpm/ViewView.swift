import SwiftUI   

struct ViewView: View {
    
    var a: Double
    var b: Double
    var c: Double
    var x1: Double
    var x2: Double
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Resultado")
                    .font(.title)
                    .fontWeight(.medium)
                
                Text("\n\(String(format: "%.1f", a)) x^2 + \(String(format: "%.1f", b)) x + \(String(format: "%.1f", c))\n")
                
                Text("x1 = \(String(format: "%.1f", x1))")
                
                Text("x2 = \(String(format: "%.1f", x2))")
                
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
