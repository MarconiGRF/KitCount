import SwiftUI

struct NewKounterStep2SheetView: View {
    @State
    var kounterData: NewKounterData
    
    @State
    private var willSetDescription: Bool = false
    
    @State
    private var hasHitNextStep: Bool? = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Image(systemName: "textformat.subscript")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color.blue)
                    .padding(.vertical, 100)
                    .frame(width: 150)
                
                VStack {
                    HStack {
                        Text("Set description?")
                            .font(.title)
                            .fontWeight(.bold)
                            .frame(width: geometry.size.width * 0.7, alignment: .leading)
                                            
                        Toggle("" ,isOn: $willSetDescription)
                            .onChange(of: willSetDescription, perform: { newValue in
                                if (newValue == false) {
                                    kounterData.desc = ""
                                }
                            })
                        
                    }.padding(.vertical, 5)
                    
                    Text("This will displayed on \"\(kounterData.name)\" details so you can describe it in more details.")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    if (willSetDescription) {
                        VStack {
                            TextField("Description", text: $kounterData.desc)
                            .multilineTextAlignment(.leading)
                            .submitLabel(.done)
                            .textFieldStyle(.roundedBorder)
                        }
                        .frame(maxHeight: .infinity, alignment: .center)
                    }
                    
                    NavigationLink(
                        destination: NewKounterStep3SheetView(kounterData: kounterData),
                        tag: true,
                        selection: $hasHitNextStep,
                        label: { EmptyView() }
                    )
                    .opacity(0)
                    
                    Button(action: { hasHitNextStep = true }) { Text("Next").frame(maxWidth: .infinity) }
                        .padding()
                        .foregroundColor(Color.white)
                        .background(.blue)
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .navigationTitle("Description")
            .navigationBarTitleDisplayMode(.inline)
            .onTapGesture {
                self.hideKeyboard()
            }
        }
    }
    
    var kounterNameIsValid: Bool {
        return !kounterData.name.isEmpty
    }
}

struct NewKounterStep2SheetView_Previews: PreviewProvider {
    static var previews: some View {
        NewKounterStep2SheetView(kounterData: .empty())
            .previewInterfaceOrientation(.portrait)
    }
}
