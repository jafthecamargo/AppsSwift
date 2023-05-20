import SwiftUI

struct ContentView: View {
    
    @State private var timer: Timer?
    @State private var progress: Float = 0
    @State private var maxValue: Float = 1.0
    @State private var bar: Double = 0
    @State private var selected = 0
    
    var body: some View {
        NavigationView {  
            VStack {
                List {
                    Section(header: Text("ProgressBar"), footer: Text("Presiona la barra para reiniciarla")
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)) {
                        HStack {
                            Spacer()
                            ProgressView()
                                .padding(.vertical, 10)
                            Spacer()
                        }
                        HStack {
                            ProgressView(value: progress)
                                .padding(.top, 5)
                                .onTapGesture {
                                    progress = 0
                                }
                            Text(String(format: "%.1f", progress))
                                .font(.headline)
                                .frame(width: 50)
                                .padding(.vertical, 10)
                        }
                    }
                    Section("SeekBar") {
                        HStack {
                            Slider(value: $bar, in: 0...10, step: 0.1)
                            Text(String(format: "%.1f", bar))
                                .font(.headline)
                                .frame(width: 50)
                                .padding(.vertical, 10)
                        }
                    }
                    Section("RatingBar") {
                       RatingsView(selected: $selected)
                    }
                }
            }
            .onAppear {
                timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                    progress += 0.1
                    if progress > maxValue {
                        progress = 1.0
                    }
                }
            }
            .onDisappear {
                timer?.invalidate()
                timer = nil
            }
            .navigationTitle("Barras")
            .padding(.horizontal, 2)
        }
        .navigationViewStyle(.stack)
    }
}

struct RatingsView : View {
    
    @Binding var selected: Int
    
    var body: some View {
        HStack(spacing: 10) {
            Spacer()
            ForEach(0..<5) {i in
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(self.selected >= i ? .yellow : .gray)
                    .onTapGesture {
                        self.selected = i
                    }
            }
            Spacer()
            Text(String(selected + 1))
                .font(.headline)
                .frame(width: 50)
                .padding(.vertical, 10)
            Spacer()
        }
    }
}

/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
