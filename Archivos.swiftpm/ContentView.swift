import SwiftUI

struct ContentView: View {
    
    @State private var text: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                TextField("Escribe algo", text: $text)
                    .padding(10)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(7)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                
                HStack {
                    Button(action: {
                        guard let fileURL = getFileURL(), FileManager.default.fileExists(atPath: fileURL.path) else { return }
                        do {
                            text = try String(contentsOf: fileURL, encoding: .utf8)
                            print("Datos cargados desde el archivo.")
                        } catch {
                            print("Error al cargar los datos: \(error.localizedDescription)")
                        }
                    }) {
                        Text("Abrir")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .font(.headline)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(7)
                    
                    Button(action: {
                        let fileName = "misdatos"
                        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
                        do {
                            try text.write(to: fileURL, atomically: true, encoding: .utf8)
                            print("Datos guardados en el archivo: \(fileURL.path)")
                        } catch {
                            print("Error al guardar los datos: \(error.localizedDescription)")
                        }
                    }) {
                        Text("Guardar")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .font(.headline)
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(7)
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .navigationTitle("Archivos")
        }
    }
    
    private func getFileURL() -> URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        let fileURL = documentsDirectory.appendingPathComponent("misdatos.txt")
        return fileURL
    }
}
