import SwiftUI
import CoreMotion

struct AcelerometroView: View {
    
    @State private var userAccelerationString: String = ""
    
    let motionManager = CMMotionManager()
    
    var body: some View {
        List {
            Section(header: Text("Acceleration")) {
                Text(userAccelerationString)
            }
        }
        .onAppear {
            startMotionUpdates()
        }
        .onDisappear {
            stopMotionUpdates()
        }
        .navigationTitle("Acelerómetro")
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
                let userAcceleration = motionData.userAcceleration
                
                // Actualiza la variable de estado con los nuevos datos
                userAccelerationString = "X: \(String(format: "%.8f", userAcceleration.x))\nY: \(String(format: "%.8f", userAcceleration.y))\nZ: \(String(format: "%.8f", userAcceleration.z))"
            }
        }
    }
    
    func stopMotionUpdates() {
        motionManager.stopDeviceMotionUpdates()
    }
}
