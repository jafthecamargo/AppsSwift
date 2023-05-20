import SwiftUI

struct ContentView: View {
    
    @State private var offset1: CGFloat = 0
    @State private var offset2: CGFloat = 0
    @State private var isPortrait = UIDevice.current.orientation.isPortrait
    
    var body: some View {
        NavigationView {
            HStack {
                Spacer()
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: 5, height: 300)
                    .foregroundColor(.gray)
                    .overlay(
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                            .offset(y: offset1)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        offset1 = min(max(value.translation.height, -150), 150)
                                    }
                                    .onEnded { _ in
                                        withAnimation {
                                            offset1 = 0
                                        }
                                    }
                                )
                            )
                Spacer()
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: 300, height: 5)
                    .foregroundColor(.gray)
                    .overlay(
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.accentColor)
                            .offset(x: offset2)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        offset2 = min(max(value.translation.width, -150),    150)
                                    }
                                    .onEnded { _ in
                                        withAnimation {
                                            offset2 = 0
                                        }
                                    }
                            )
                    )
                Spacer()
            }
            .navigationBarTitle("Barras H y V")
            .onAppear {
                NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: nil, queue: .main) { _ in
                    isPortrait = UIDevice.current.orientation.isPortrait
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
