import SwiftUI

struct ContentView: View {
    
    @State private var giroscopio = false
    @State private var gps = false
    @State private var rotacion = false
    @State private var aceleracion = false
    @State private var campo = false
    @State private var altimetro = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    NavigationLink(destination: AcelerometroView()) {
                        HStack {
                            Image(systemName: "figure.run")
                                .resizable()
                                .scaledToFit()
                                .padding(5)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.accentColor)
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Acelerómetro")
                                    .font(.headline)
                            }
                            .padding(.leading, 10)
                        }
                    }
                    NavigationLink(destination: GiroscopioView()) {
                        HStack {
                            Image(systemName: "gyroscope")
                                .resizable()
                                .scaledToFit()
                                .padding(5)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.accentColor)
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Giroscopio")
                                    .font(.headline)
                            }
                            .padding(.leading, 10)
                        }
                    }
                    NavigationLink(destination: MagnetometroView()) {
                        HStack {
                            Image(systemName: "globe.americas.fill")
                                .resizable()
                                .scaledToFit()
                                .padding(5)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.accentColor)
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Magnetómetro")
                                    .font(.headline)
                            }
                            .padding(.leading, 10)
                        }
                    }
                    NavigationLink(destination: BarometroView()) {
                        HStack {
                            Image(systemName: "barometer")
                                .resizable()
                                .scaledToFit()
                                .padding(5)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.accentColor)
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Barómetro")
                                    .font(.headline)
                            }
                            .padding(.leading, 10)
                        }
                    }
                    NavigationLink(destination: GPSView()) {
                        HStack {
                            Image(systemName: "location.circle")
                                .resizable()
                                .scaledToFit()
                                .padding(5)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.accentColor)
                            VStack(alignment: .leading, spacing: 5) {
                                Text("GPS")
                                    .font(.headline)
                            }
                            .padding(.leading, 10)
                        }
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
            .padding(.top, 5)
            .navigationTitle("Sensores")
        }
        .navigationViewStyle(.stack)
    }
}
