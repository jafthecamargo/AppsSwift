import SwiftUI

struct ViewView: View {
    
    @State private var offset: CGFloat = 0
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 50, height: 300)
                .foregroundColor(.gray)
                .overlay(
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
                        .offset(y: offset)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    offset = min(max(value.translation.height, -125), 125)
                                }
                                .onEnded { _ in
                                    withAnimation {
                                        offset = 0
                                    }
                                }
                        )
                )
        }
    }
}


struct ViewView_Previews: PreviewProvider {
    static var previews: some View {
        ViewView()
    }
}
