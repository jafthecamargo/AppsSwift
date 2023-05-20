import SwiftUI

struct ContentView: View {
    
    @State private var isChecked : Bool = false
    @State private var chk : Bool = false
    @State var pkr = "Opción 1"
    
    func toggle(){isChecked = !isChecked}
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Spacer()
                    
                    Picker(selection: $pkr, label: Text("Un Picker")) {
                        Text("Opción 1").tag("Opción 1")
                        Text("Opción 2").tag("Opción 2")
                    }
                        .padding(.bottom, 35)
                
                    Spacer()

                    HStack {
                        Button(action: toggle) {
                            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                        }
                        Text("Un CheckBox")
                    }
                    
                    Spacer()
                    
                    List {
                        Toggle("Un Toggle", isOn: $chk) 
                    }
                        .frame(height: 110)
                    
                    Spacer()
                }
                VStack {
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            print("Swift")
                        }) {
                            Image(systemName: "swift")
                                .resizable()
                                .padding(8)
                                .frame(width: 40, height: 40, alignment: .center)
                                .foregroundColor(.white)
                        }
                        .padding(10)
                        .font(.headline)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(200)
                        .hoverEffect(.lift)
                        
                        Spacer()
                        
                        Button(action: {
                            print("Folder")
                        }) {
                            Image(systemName: "folder.fill")
                                .padding()
                                .frame(width: 40, height: 40, alignment: .center)
                                .foregroundColor(.white)
                        }
                        .padding(10)
                        .font(.headline)
                        .background(Color.yellow)
                        .foregroundColor(.white)
                        .cornerRadius(200)
                        .hoverEffect(.lift)
                        
                        Spacer()
                        
                        Button(action: {
                            print("Inbox")
                        }) {
                            Image(systemName: "tray.fill")
                                .frame(width: 40, height: 40, alignment: .center)
                                .foregroundColor(.white)
                        }
                        .padding(10)
                        .font(.headline)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(200)
                        .hoverEffect(.lift)
                        
                        Spacer()
                        
                        Button(action: {
                            print("Book")
                        }) {
                            Image(systemName: "book.fill")
                                .frame(width: 40, height: 40, alignment: .center)
                                .foregroundColor(.white)
                        }
                        .padding(10)
                        .font(.headline)
                        .background(Color.brown)
                        .foregroundColor(.white)
                        .cornerRadius(200)
                        .hoverEffect(.lift)
                        
                        Spacer()
                    }
                    
                    Spacer()
                    
                    Button("Un Botón") {
                        print("Button")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .font(.headline)
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(7)
                    .hoverEffect(.automatic)
                    
                    Spacer()
                    
                    Text("© Jafthe Camargo")
                        .font(.caption)
                        .foregroundColor(Color.gray)
                    
                    Spacer()
                }
            }
            .navigationTitle("Botones")
            .padding()
        }
        .navigationViewStyle(.stack)
    }
}
