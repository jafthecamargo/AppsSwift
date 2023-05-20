import SwiftUI

struct ContentView: View {
    
    @State var pkr = "Opción 1"
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Picker(selection: $pkr, label: Text("Un Picker")) {
                    Text("Opción 1").tag("Opción 1")
                    Text("Opción 2").tag("Opción 2")
                    Text("Opción 3").tag("Opción 3")
                    Text("Opción 4").tag("Opción 4")
                    Text("Opción 5").tag("Opción 5")
                    Text("Opción 6").tag("Opción 6")
                    Text("Opción 7").tag("Opción 7")
                    Text("Opción 8").tag("Opción 8")
                    Text("Opción 9").tag("Opción 9")
                    Text("Opción 10").tag("Opción 10")
                }
                
                Spacer()
                
                Text("© Jafthe Camargo")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                
                Spacer()
            }
            .navigationTitle("Spinner")
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("\(pkr)"))
            }
        }
        .navigationViewStyle(.stack)
        .onChange(of: pkr) { _ in
            showAlert = true
        }
    }
}
