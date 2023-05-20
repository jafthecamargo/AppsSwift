import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var isTorchOn = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Button(action: {
                    self.isTorchOn.toggle()
                }) {
                    if isTorchOn {
                        Image(systemName: "flashlight.on.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .padding()
                            .foregroundColor(.white)
                    } else {
                        Image(systemName: "flashlight.off.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .padding()
                            .foregroundColor(.white)
                    }
                }
                .padding(10)
                .frame(width: 100, height: 100, alignment: .center)
                .background(Color.yellow)
                .cornerRadius(200)
                Spacer()
            }
            .navigationTitle("Lámpara")
            .onAppear {
                do {
                    try AVCaptureDevice.default(for: .video)?.lockForConfiguration()
                } catch {
                    print("Error al bloquear la configuración del dispositivo de la cámara: \(error.localizedDescription)")
                }
            }
            .onDisappear {
                AVCaptureDevice.default(for: .video)?.torchMode = .off
                AVCaptureDevice.default(for: .video)?.unlockForConfiguration()
            }
            .onChange(of: isTorchOn) { newValue in
                if newValue {
                    do {
                        try AVCaptureDevice.default(for: .video)?.setTorchModeOn(level: 1.0)
                    } catch {
                        print("Error al encender la linterna: \(error.localizedDescription)")
                    }
                } else {
                    AVCaptureDevice.default(for: .video)?.torchMode = .off
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}
