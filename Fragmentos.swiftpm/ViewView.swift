import SwiftUI

struct ViewView: View {
    
    var body: some View {
        VStack {
            List {
                NavigationLink(destination: Text("Reporte de aprovechamiento 1")) {
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Estudiante 1")
                                .font(.title3)
                                .fontWeight(.medium)
                            Text("Calificación 1")
                                .font(.subheadline)
                        }
                    }
                }
                NavigationLink(destination: Text("Reporte de aprovechamiento 2")) {
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Estudiante 2")
                                .font(.title3)
                                .fontWeight(.medium)
                            Text("Calificación 2")
                                .font(.subheadline)
                        }
                    }
                }
                NavigationLink(destination: Text("Reporte de aprovechamiento 3")) {
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Estudiante 3")
                                .font(.title3)
                                .fontWeight(.medium)
                            Text("Calificación 3")
                                .font(.subheadline)
                        }
                    }
                }
                NavigationLink(destination: Text("Reporte de aprovechamiento 4")) {
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Estudiante 4")
                                .font(.title3)
                                .fontWeight(.medium)
                            Text("Calificación 4")
                                .font(.subheadline)
                        }
                    }
                }
                NavigationLink(destination: Text("Reporte de aprovechamiento 5")) {
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Estudiante 5")
                                .font(.title3)
                                .fontWeight(.medium)
                            Text("Calificación 5")
                                .font(.subheadline)
                        }
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
        .padding()
    }
}
