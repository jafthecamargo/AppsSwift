import SwiftUI

struct ViewView: View {
    @State private var kaprekarNumbers: [Int] = []
    
    var body: some View {
        VStack {
            List(kaprekarNumbers, id: \.self) { number in
                Text("\(number)")
            }
            .navigationTitle("Números Kaprekar")
        }
        .onAppear {
            calculateKaprekarNumbers()
        }
    }
    
    func calculateKaprekarNumbers() {
        for number in 1...100000 {
            let square = number * number
            let digits = String(square).map { Int(String($0))! }
            for i in 1..<digits.count {
                let left = digits[0..<i].reduce(0) { $0 * 10 + $1 }
                let right = digits[i...].reduce(0) { $0 * 10 + $1 }
                if left + right == number {
                    kaprekarNumbers.append(number)
                    break
                }
            }
        }
    }
}
