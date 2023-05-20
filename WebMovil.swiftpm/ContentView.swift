import SwiftUI
import SafariServices

struct ContentView: View {
    
    @State private var isShowingSafariView = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button("Abrir Web") {
                    isShowingSafariView = true
                }
                .frame(maxWidth: .infinity)
                .padding(10)
                .font(.headline)
                .background(Color.accentColor)
                .foregroundColor(.white)
                .cornerRadius(7)
                .hoverEffect(.automatic)
                .sheet(isPresented: $isShowingSafariView) {
                    SafariView(url: URL(string: "https://www.google.com.mx")!)
                        .edgesIgnoringSafeArea(.all)
                }
            }
            .navigationTitle("WebMovil")
            .padding()
        }
    }
}

struct SafariView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        // Implementamos el metodo obligatorio para actualizar la vista
    }
}

