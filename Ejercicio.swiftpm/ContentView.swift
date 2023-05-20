import SwiftUI

struct ContentView: View {
    
    @State private var bar: Float = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    HStack {
                        Slider(value: $bar, in: 0...300, step: 0.1)
                        Text(String(format: "%.1f", bar))
                            .font(.headline)
                            .frame(width: 50)
                            .padding(.vertical, 10)
                    }
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Circle()
                            .frame(width: CGFloat(bar), height: CGFloat(bar))
                        Spacer()
                    }
                    Spacer()
                }
            }
            .navigationTitle("Ejercicio")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ViewView()) {
                        Image(systemName: "number")
                            .foregroundColor(Color.accentColor)
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}
