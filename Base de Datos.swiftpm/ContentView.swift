import SwiftUI

struct Name: Identifiable {
    var id: Int
    var value: String
}

struct ContentView: View {

    @State var names: [Name] = []
    @State var nameInput: String = ""
    @State var idInput: String = ""
    @State var lista = false
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("ID", text: $idInput)
                    .padding(10)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(7)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .keyboardType(.numberPad)
                
                TextField("Nombre", text: $nameInput)
                    .padding(10)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(7)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .autocorrectionDisabled(true)
                
                HStack {
                    Button(action: {
                        self.lista.toggle()
                    }) {
                        Text("Lista")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .font(.headline)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(7)
                    
                    Button(action: {
                        if !nameInput.isEmpty {
                            let idd = Int(idInput)
                            let name = Name(id: idd!, value: nameInput)
                            names.append(name)
                            nameInput = ""
                        }
                    }) {
                        Text("Alta")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .font(.headline)
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(7)
                }
                
                if lista {
                    List(names) { name in
                        Text("\(name.id) - \(name.value)")
                    }
                }
            }
            .padding(.horizontal, 20)
            .navigationTitle("Base de Datos")
        }
    }
}
