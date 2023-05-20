import SwiftUI
import CoreMotion

struct MagnetometroView: View {
    
    @State private var magnetometerString: String = ""
    @State var magnetometerData: [Double] = [0.0, 0.0, 0.0]
    
    let motionManager = CMMotionManager()
    
    var body: some View {
        List {
            Section(header: Text("Magnetic Field")) {
                Text(magnetometerString)
            }
        }
        .onAppear() {
            if motionManager.isMagnetometerAvailable {
                motionManager.magnetometerUpdateInterval = 0.1
                motionManager.startMagnetometerUpdates(to: .main) { (data, error) in
                    guard let data = data else { return }
                    magnetometerData = [data.magneticField.x, data.magneticField.y, data.magneticField.z]
                     magnetometerString = "X: \(String(format: "%.2f", magnetometerData[0]))\nY: \(String(format: "%.2f", magnetometerData[1]))\nZ: \(String(format: "%.2f", magnetometerData[2]))"
                }
            }
        }
        .navigationTitle("Magnetómetro")
    }
}
