import SwiftUI
import CoreMotion

struct GiroscopioView: View {
    
    @State private var rotationRateString: String = ""
    
    let motionManager = CMMotionManager()
    
    var body: some View {
        List {
            Section(header: Text("Rotation Rate")) {
                Text(rotationRateString)
            }
        }
        .onAppear {
            startMotionUpdates()
        }
        .onDisappear {
            stopMotionUpdates()
        }
        .navigationTitle("Giroscopio")
    }
    
    func startMotionUpdates() {
        // Verifica si el dispositivo tiene un detector de movimiento
        guard motionManager.isDeviceMotionAvailable else { return }
        
        // Frecuencia de actualización de los datos del detector de movimiento (en segundos)
        motionManager.deviceMotionUpdateInterval = 0.1
        
        // Inicia la captura de datos de movimiento
        motionManager.startDeviceMotionUpdates(to: .main) { (motionData, error) in
            if let motionData = motionData {
                // Aquí puedes acceder a los datos de movimiento
                let rotationRate = motionData.rotationRate
                
                // Actualiza la variable de estado con los nuevos datos
                rotationRateString = "X: \(String(format: "%.8f", rotationRate.x))\nY: \(String(format: "%.8f", rotationRate.y))\nZ: \(String(format: "%.8f", rotationRate.z))"
            }
        }
    }
    
    func stopMotionUpdates() {
        motionManager.stopDeviceMotionUpdates()
    }
}
