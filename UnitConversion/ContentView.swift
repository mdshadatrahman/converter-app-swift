import SwiftUI

struct ContentView: View {
    let units: [String] = ["KM", "Meter", "Feet", "Mile"]
    @State private var from: String = ""
    @State private var to: String = ""
    @State private var selectedFrom: Int = 0
    @State private var selectedTo: Int = 0
    var body: some View {
        NavigationView{
            Form {
                Section {
                        Picker("From", selection: $from){
                            ForEach(units, id: \.self) {
                                Text("\($0)")
                            }
                        }.pickerStyle(.segmented)
                    
                    TextField(
                        "Enter the value",
                        value: $selectedFrom,
                        format: .number
                    )
                } header: {
                    Text("From")
                }
                
                Section {
                        Picker("To", selection: $to){
                            ForEach(units, id: \.self) {
                                Text("\($0)")
                            }
                        }.pickerStyle(.segmented)
                    
                        Text("\(selectedTo)")
                    
                } header: {
                    Text("To")
                }
            }.navigationTitle("Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
