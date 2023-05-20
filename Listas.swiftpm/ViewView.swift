import SwiftUI

struct ViewView: View {
    
    var body: some View {
            VStack {
                List {
                    HStack {
                        Image(systemName: "tree.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 30)
                            .foregroundColor(.accentColor)
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Datos de Entrada 1")
                                .font(.headline)
                            Text("Por Jafthe ESCOM 1 on 1/1/17")
                                .font(.subheadline)
                        }
                        .padding(.leading, 10)
                    }
                    HStack {
                        Image(systemName: "person.crop.circle.dashed")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 30)
                            .foregroundColor(.accentColor)
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Datos de Entrada 2")
                                .font(.headline)
                            Text("Por Jafthe ESCOM 2 on 1/2/17")
                                .font(.subheadline)
                        }
                        .padding(.leading, 10)
                    }
                    HStack {
                        Image(systemName: "signpost.right.and.left.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 30)
                            .foregroundColor(.accentColor)
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Datos de Entrada 3")
                                .font(.headline)
                            Text("Por Jafthe ESCOM 3 on 1/3/17")
                                .font(.subheadline)
                        }
                        .padding(.leading, 10)
                    }
                    HStack {
                        Image(systemName: "key.horizontal.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 30)
                            .foregroundColor(.accentColor)
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Datos de Entrada 4")
                                .font(.headline)
                            Text("Por Jafthe ESCOM 4 on 1/4/17")
                                .font(.subheadline)
                        }
                        .padding(.leading, 10)
                    }
                    HStack {
                        Image(systemName: "iphone.gen3.badge.play")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 30)
                            .foregroundColor(.accentColor)
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Datos de Entrada 5")
                                .font(.headline)
                            Text("Por Jafthe ESCOM 5 on 1/5/17")
                                .font(.subheadline)
                        }
                        .padding(.leading, 10)
                    }
                }
                .listStyle(.automatic)
                .padding(.top, -5)
                
                Spacer()
                
                Text("© Jafthe Camargo")
                    .font(.caption)
                    .foregroundColor(Color.gray)

                Spacer()
            }
            .padding(5)
    }
}
