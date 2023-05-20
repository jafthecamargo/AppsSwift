import SwiftUI
import CoreLocation

struct GPSView: View {
    
    @State private var gpsString: String = ""
    @State var userLocation: CLLocation?
    
    let locationManager = CLLocationManager()
    
    var body: some View {
        List {
            Section(header: Text("Location")) {
                Text(gpsString)
            }
        }
        .onAppear() {
            locationManager.requestWhenInUseAuthorization()
            if CLLocationManager.locationServicesEnabled() {
                locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                locationManager.startUpdatingLocation()
                userLocation = locationManager.location
                gpsString = "Latitud: \(String(format: "%.4f", userLocation?.coordinate.latitude ?? 0.0))\nLongitud: \(String(format: "%.4f", userLocation?.coordinate.longitude ?? 0.0))"
            }
        }
        .navigationTitle("GPS")
    }
}
