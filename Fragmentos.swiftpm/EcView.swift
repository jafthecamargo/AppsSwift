import SwiftUI

struct EcView: View {
    
    @State private var atxt = ""
    @State private var btxt = ""
    @State private var ctxt = ""
    @State private var a = 0.0 
    @State private var b = 0.0
    @State private var c = 0.0
    @State private var x1 = 0.0
    @State private var x2 = 0.0
    @State private var resultado = false
    
    var body: some View {
        NavigationView {
            VStack {
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
                        .frame(maxWidth: .infinity)
                        .autocorrectionDisabled()
                        .onSubmit {
                            calcular(atxt: atxt, btxt: btxt, ctxt: ctxt)
                        }
                    
                    TextField("b", text: $btxt)
                        .padding(10)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(7)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .autocorrectionDisabled()
                        .onSubmit {
                            calcular(atxt: atxt, btxt: btxt, ctxt: ctxt)
                        }
                     
                    TextField("c", text: $ctxt)
                        .padding(10)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(7)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .autocorrectionDisabled()
                        .onSubmit {
                            calcular(atxt: atxt, btxt: btxt, ctxt: ctxt)
                        }
                }
                
                Button("Calcular") {
                   calcular(atxt: atxt, btxt: btxt, ctxt: ctxt)
                }
                .frame(maxWidth: .infinity)
                .padding(10)
                .font(.headline)
                .background(Color.accentColor)
                .foregroundColor(.white)
                .cornerRadius(7)
                
                Spacer()
                
                if resultado {
                    Text("Resultado")
                        .font(.title3)
                        .fontWeight(.medium)
                    
                    Text("\n\(String(format: "%.1f", a)) x^2 + \(String(format: "%.1f", b)) x + \(String(format: "%.1f", c))\n")
                    
                    Text("x1 = \(String(format: "%.1f", x1))")
                    
                    Text("x2 = \(String(format: "%.1f", x2))")
                }
                
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
    
    func calcular(atxt: String, btxt: String, ctxt: String) {
        a = Double(atxt) ?? 0
        b = Double(btxt) ?? 0
        c = Double(ctxt) ?? 0
        print(fg(a: a, b: b, c: c))
        withAnimation {
            resultado = true
        }
    }
    
    func fg(a: Double, b: Double, c: Double) -> (x1: Double, x2: Double) {
        print("ax^2 + bx + c = 0")
        print("a = " + String(a))
        print("b = " + String(b))
        print("c = " + String(c))
        
        let dis = b * b - 4 * a * c
        if dis < 0 {
            let tempdis = dis * -1
            let raizDis = sqrt(tempdis)
            print(raizDis)
            x1 = (-b) / (2 * a)
            x2 = (raizDis) / (2 * a)
            print(x1, x2)
        } else {
            let raizDis = sqrt(dis)
            x1 = (-b + raizDis) / (2 * a)
            x2 = (-b - raizDis) / (2 * a)
            print(x1, x2)
        }
        return (x1, x2)
    }
}
