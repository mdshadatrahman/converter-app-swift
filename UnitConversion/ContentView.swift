import SwiftUI

struct ContentView: View {
    let units: [String] = ["KM", "Meter", "Feet", "Mile"]
    @State private var from: String = ""
    @State private var to: String = ""
    @State private var selectedFrom: Int = 0
//    @State private var selectedTo: Int = 0
    
    var convertedValue: String {
        var result: Double = 0.0
        if(from == "KM" && to == "KM") {
            result = Double(selectedFrom)
        } else if(from == "KM" && to == "Meter") {
            result = Double(selectedFrom * 1000)
        } else if(from == "KM" && to == "Feet") {
            result = Double(Double(selectedFrom) * 3280.84)
        } else if(from == "KM" && to == "Mile") {
            result = Double(Double(selectedFrom) * 0.621371)
        } else if(from == "Meter" && to == "KM") {
            result = Double(selectedFrom / 1000)
        } else if(from == "Meter" && to == "Meter") {
            result = Double(selectedFrom)
        } else if(from == "Meter" && to == "Feet") {
            result = Double(Double(selectedFrom) * 3.28084)
        } else if(from == "Meter" && to == "Mile") {
            result = Double(Double(selectedFrom) / 0.000621371)
        } else if(from == "Feet" && to == "KM") {
            result = Double(Double(selectedFrom) / 0.0003048)
        } else if(from == "Feet" && to == "Meter") {
            result = Double(Double(selectedFrom) / 0.3048)
        } else if(from == "Feet" && to == "Feet") {
            result = Double(selectedFrom)
        } else if(from == "Feet" && to == "Mile") {
            result = Double(Double(selectedFrom) / 0.000189394)
        }  else if(from == "Mile" && to == "KM") {
            result = Double(Double(selectedFrom) * 1.60934)
        } else if(from == "Mile" && to == "Meter") {
            result = Double(Double(selectedFrom) * 1609.34)
        } else if(from == "Mile" && to == "Feet") {
            result = Double(Double(selectedFrom) * 5280)
        } else if(from == "Mile" && to == "Mile") {
            result = Double(selectedFrom)
        }
        return String(format:"%.2f", result)
    }
    
    
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
                    
                        Text("\(convertedValue)")
                    
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
