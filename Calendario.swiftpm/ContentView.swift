import SwiftUI

struct ContentView: View {
    
    @State private var date: Date = Date()
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("", selection: $date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .environment(\.locale, Locale(identifier: "es_ES"))
                Spacer()
                Text("\(formattedDate(date))")
                    .font(.headline)
                Spacer()
            }
            .padding()
            .navigationTitle("Calendario")
        }
    }
    
    func formattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .medium
        dateFormatter.locale = Locale(identifier: "es_ES")
        return dateFormatter.string(from: date)
    }
}

