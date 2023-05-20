import SwiftUI

struct ContentView: View {

    @State var isCLCOn: Bool = true
    @State var isCPOn: Bool = true
    @State var isMMSOn: Bool = true
    @State var isMMSPOn: Bool = true
    @State var isSMSOn: Bool = true
    @State var isCapture: Bool = false
    @State var isShowingShareActivity = false
    
    var device = UIDevice.current.name
    var systemName = UIDevice.current.systemName
    var systemVersion = UIDevice.current.systemVersion
    var batteryLevel = UIDevice.current.batteryLevel
    var batteryState = UIDevice.current.batteryState
    var proximityState = UIDevice.current.proximityState
    var orientation  = UIDevice.current.orientation
    var batteryMonitoringEnable = UIDevice.current.isBatteryMonitoringEnabled
    var multitaskingSupported = UIDevice.current.isMultitaskingSupported
    var proximityMonitoringEnable = UIDevice.current.isProximityMonitoringEnabled
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Available Providers")){
                        Toggle("CallLog Calls", isOn: $isCLCOn) 
                        Toggle("Contacts Phones", isOn: $isCPOn) 
                        Toggle("MMS", isOn: $isMMSOn) 
                        Toggle("MMSParts", isOn: $isMMSPOn) 
                        Toggle("SMS", isOn: $isSMSOn) 
                    }
                }
                .navigationTitle("AFLogical OSE")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        
                        let fileName = "Info"
                        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("xml")
                        let writeString = "Device: \(device)\nName: \(systemName)\niOS Version: \(systemVersion)\nBattery Level: \(batteryLevel)\nBattery State: \(batteryState)\nProximityState: \(proximityState)\nOrientation: \(orientation)\nBatteryMonitoringEnable: \(batteryMonitoringEnable)\nMultitaskingSupported: \(multitaskingSupported)\nProximitMonitoringEnable: \(proximityMonitoringEnable)"
                        
                        ShareLink(item: fileURL)
                        
                        Button {
                            if(isMMSOn&&isMMSPOn == true) {
                                do {
                                    try writeString.write(to: fileURL, atomically: true, encoding:
                                                            String.Encoding.utf8)
                                    print("File Path: \(fileURL.path)")
                                    isCapture = true
                                } catch let error as NSError {
                                    print("Failed")
                                    print(error)
                                }
                            } else {
                                print("MMS, MMSParts Disable")
                            }
                            
                        } label: {
                            Label("Capture", systemImage: "folder")
                        }
                    }
                }
                .accentColor(.purple)
                .alert(isPresented: $isCapture, content: {
                    Alert(title: Text("Successful Capture"), message: Text("Info.xml"))
                })
                
                Spacer()
                
                Text("© Jafthe Camargo")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                
                Spacer()
            }
            .navigationViewStyle(.stack)
        }
    }
}
