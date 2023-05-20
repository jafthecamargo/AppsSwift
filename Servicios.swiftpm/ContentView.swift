import SwiftUI

struct ContentView: View {
    
    @State private var tiempo: TimeInterval = 0
    @State private var activo = false
    @State private var pause = false
    @State private var pausar = false
    @State private var continuar = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                Spacer()
                
                Text(String(format: "%2d:%02ds", Int(tiempo) % 60, Int(tiempo * 100) % 100))
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Spacer()
                
                HStack {
                    Button("Iniciar") {
                        activo = true
                        withAnimation {
                            pausar = true
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(10)     
                    .font(.headline)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(7)
                    
                    Button("Terminar") {
                        tiempo = 0
                        activo = false
                        pause = false
                        withAnimation {
                            pausar = false
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .font(.headline)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(7)
                }
                    
                if pausar {
                    Button("Pausar") {
                        pause = true
                        withAnimation {
                            continuar = true
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(10)     
                    .font(.headline)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(7)
                    
                    if continuar {
                        Button("Continuar") {
                             pause = false
                            withAnimation {
                                continuar = false
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(10)     
                        .font(.headline)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(7)
                    }
                }
                
                Spacer()
                
                Text("© Jafthe Camargo")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                
                Spacer()
            }
            .navigationTitle("Servicios")
            .padding()
        }
        .navigationViewStyle(.stack)
        .onAppear(perform: {
            Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                if !self.pause && self.activo {
                    self.tiempo += 0.01
                }
            }
        })
    }
}
