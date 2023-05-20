import SwiftUI

struct ContentView: View {
    
    @State private var atxt = ""
    @State private var btxt = ""
    @State private var ctxt = ""
    @State private var a = 0.0 
    @State private var b = 0.0
    @State private var c = 0.0
    @State private var x1 = 0.0
    @State private var x2 = 0.0
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Image(systemName: "x.squareroot")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150, alignment: .center)
                    .foregroundColor(.accentColor)
                
                Spacer()
                
                HStack {
                    TextField("a", text: $atxt)
                        .padding(10)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(7)
                        .font(.headline)
                        .keyboardType(.numberPad)
                        .frame(maxWidth: .infinity)
                    
                    TextField("b", text: $btxt)
                        .padding(10)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(7)
                        .font(.headline)
                        .keyboardType(.numberPad)
                        .frame(maxWidth: .infinity)
                    
                    TextField("c", text: $ctxt)
                        .padding(10)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(7)
                        .font(.headline)
                        .keyboardType(.numberPad)
                        .frame(maxWidth: .infinity)
                }
                
                NavigationLink(destination: ViewView(a: a, b: b, c: c, x1: x1, x2: x2)
                    .onAppear {
                        a = Double(atxt) ?? 0
                        b = Double(btxt) ?? 0
                        c = Double(ctxt) ?? 0
                        print(fg(a: a, b: b, c: c))
                    }) {
                    Text("Calcular")
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
            .padding()
            .navigationTitle("Ec. 2° Grado")
        }
        .navigationViewStyle(.stack)
    }
    func fg(a: Double, b: Double, c: Double) -> (x1: Double, x2: Double) {
        print("\nax^2 + bx + c = 0")
        print("a = " + String(a))
        print("b = " + String(b))
        print("c = " + String(c))
        
        let dis = b * b - 4 * a * c
        if dis < 0 {
            let tempdis = dis * -1
            let raizDis = sqrt(tempdis)
            x1 = (-b) / (2 * a)
            x2 = (raizDis) / (2 * a)
        } else {
            let raizDis = sqrt(dis)
            x1 = (-b + raizDis) / (2 * a)
            x2 = (-b - raizDis) / (2 * a)
        }
        return (x1, x2)
    }
}
