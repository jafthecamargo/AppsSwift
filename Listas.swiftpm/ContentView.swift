import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Elemento 1")
                                .font(.title3)
                                .frame(height: 37)
                        }
                    }
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Elemento 2")
                                .font(.title3)
                                .frame(height: 37)
                        }
                    }
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Elemento 3")
                                .font(.title3)
                                .frame(height: 37)
                        }
                    }
                }
                .listStyle(.inset)
                .padding(.top, -15)
          
                Spacer()  
                
                Text("© Jafthe Camargo")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                
                Spacer()
            }
            .navigationTitle("Listas")
            .padding()
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ViewView()) {
                        Image(systemName: "photo")
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}
