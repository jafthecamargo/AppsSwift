import SwiftUI

struct ContentView: View {
    
    @State private var form = false
    @State private var aceptar = false
    @State private var dato: String = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                if aceptar {
                    Spacer()
                    
                    Text("Dato del Fragment: " + dato)
                }
                
                Spacer()
               
                Button("Digitar") {
                    withAnimation {
                        self.form.toggle()
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(10)
                .font(.headline)
                .background(Color.accentColor)
                .foregroundColor(.white)
                .cornerRadius(7)
                
                if form {
                    Spacer()
                    
                    VStack {
                        TextField("Dato del Fragmento", text: $dato)
                            .padding(10)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(7)
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .autocorrectionDisabled()
                            .onSubmit {
                                withAnimation {
                                    aceptar = true
                                }
                            }
                        HStack {
                            Button("Aceptar") {
                                withAnimation {
                                    aceptar = true
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding(10)
                            .font(.headline)
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(7)
                            
                            Button("Cancelar") {
                                withAnimation {
                                    aceptar = false
                                    dato = ""
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
                }
                
                Spacer()
                
                Text("© Jafthe Camargo")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                
                Spacer()
            }
            .navigationTitle("Fragmentos")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ViewView()) {
                        Image(systemName: "list.bullet")
                    }
                    NavigationLink(destination: EcView()) {
                        Image(systemName: "x.squareroot")
                    }
                }
            }
            .padding()
        }
        .navigationViewStyle(.stack)
    }
}
