import SwiftUI
import AVFoundation

struct SoundModel: Hashable {
    let name: String
    
    func getURL() -> URL {
        return URL(string: Bundle.main.path(forResource: name, ofType: "mp3")!)!
    }
}

let arrayOfSounds: [SoundModel] = [
    .init(name: "cuerdaA1"),
    .init(name: "cuerdaB1"),
    .init(name: "cuerdaD1"),
    .init(name: "cuerdaE1"),
    .init(name: "cuerdaE2"),
    .init(name: "cuerdaG1"),
]

struct ContentView: View {
    
    @State var player: AVAudioPlayer?
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                ForEach(arrayOfSounds, id: \.self) { sound in
                    Button(action: {
                        player = try! AVAudioPlayer(contentsOf: sound.getURL())
                        player?.prepareToPlay()
                        player?.play()
                    }) {
                        Text("\(sound.name)")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .font(.title.weight(.medium))
                            .background(Color.accentColor)
                            .foregroundColor(Color.white)
                            .cornerRadius(7)
                    }
                }
            }
            .navigationBarTitle("Afinador")
            .padding(.horizontal, 20)
        }
    }
}
