import SwiftUI
import shared

func sum(_ firstNum: String, _ secondNum: String) -> String {
    let calculator = Calculator()

    if let firstNum = Int32(firstNum), let secondNum = Int32(secondNum) {
        return String(calculator.sum(a: firstNum, b: secondNum))
    } else {
        return "🤔"
    }
}

struct ContentView: View {
    let greet = Greeting().greeting()
    
    @State private var firstNum: String = "0"
    @State private var secondNum: String = "0"

    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(alignment: .center) {
            Text(greet)
            HStack(alignment: .center) {
                TextField("A", text: $firstNum)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                    .frame(width: 30)
                Text("+")
                TextField("B", text: $secondNum)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                    .frame(width: 30)
                Text("=")
                Text(sum(firstNum, secondNum))
            }
        }
        .onReceive(timer) { _ in
            firstNum = (firstNum == "0") ? "1" : "0"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
