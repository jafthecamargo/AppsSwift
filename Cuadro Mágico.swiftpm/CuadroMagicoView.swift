import SwiftUI

struct CuadroMagicoView: View {
    
    var tamaño: String
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                if let n = Int(tamaño), n > 0 {
                    
                    let magicSquare = generateMagicSquare(n)
                    
                    ForEach(0..<n) { row in
                        HStack(spacing: 10) {
                            ForEach(0..<n) { col in
                                Text("\(magicSquare[row][col])")
                                    .frame(width: 50, height: 50)
                                    .background(Color.accentColor)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
                
                Spacer()
                
                Text("© Jafthe Camargo")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                
                Spacer()
            }
            .padding()
        }
        .navigationViewStyle(.stack)
    }
    
    func generateMagicSquare(_ n: Int) -> [[Int]] {
        var magicSquare = Array(repeating: Array(repeating: 0, count: n), count: n)
        
        var i = n/2
        var j = n-1
        
        for num in 1...(n*n) {
            if magicSquare[i][j] != 0 {
                j = (j - 2 + n) % n
                i = (i + 1) % n
            }
            
            magicSquare[i][j] = num
            
            j = (j + 1) % n
            i = (i - 1 + n) % n
        }
        
        return magicSquare
    }
}
