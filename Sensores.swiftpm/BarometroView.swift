import SwiftUI
import CoreMotion

struct BarometroView: View {
    
    @State private var attitudeString: String = ""
    @State private var altitudeString: String = ""
    @State private var pressureString: String = ""
    
    let motionManager = CMMotionManager()
    let altimeter = CMAltimeter()
    
    var body: some View {
        List {
            Section(header: Text("Attitude")) {
                Text(attitudeString)
            }
            Section(header: Text("Pressure")) {
                Text(altitudeString)
                Text(pressureString)
            }
        }
        .onAppear {
            startMotionUpdates()
            startAltimeterUpdates()
        }
        .onDisappear {
            stopMotionUpdates()
            stopAltimeterUpdates()
        }
        .navigationTitle("Barómetro")
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
                let attitude = motionData.attitude
                
                // Actualiza la variable de estado con los nuevos datos
                attitudeString = "Roll: \(String(format: "%.8f", attitude.roll))\nPitch: \(String(format: "%.8f", attitude.pitch))\nYaw: \(String(format: "%.8f", attitude.yaw))"
            }
        }
    }
    
    func stopMotionUpdates() {
        motionManager.stopDeviceMotionUpdates()
    }
    func startAltimeterUpdates() {
        // Verifica si el dispositivo tiene un sensor barométrico
        guard CMAltimeter.isRelativeAltitudeAvailable() else { return }
        
        // Inicia la captura de datos de altitud y presión atmosférica
        altimeter.startRelativeAltitudeUpdates(to: .main) { (altitudeData, error) in
            if let altitudeData = altitudeData {
                // Aquí puedes acceder a los datos de altitud y presión atmosférica
                let altitude = altitudeData.relativeAltitude.doubleValue
                let pressure = altitudeData.pressure.doubleValue
                
                // Actualiza la variable de estado con los nuevos datos
                altitudeString = String(format: "%.2f meters", altitude)
                pressureString = String(format: "%.2f kPa", pressure)
            }
        }
    }
    
    func stopAltimeterUpdates() {
        altimeter.stopRelativeAltitudeUpdates()
    }
}
