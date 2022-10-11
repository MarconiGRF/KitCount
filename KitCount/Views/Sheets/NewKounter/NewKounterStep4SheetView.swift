import SwiftUI
import Combine

struct NewKounterStep4SheetView: View {
    @State
    var kounterData: NewKounterData
    
    @State
    private var willSetGoal: Bool = false
    
    @State
    private var hasHitNextStep: Bool? = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Image(systemName: "calendar")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color.blue)
                    .padding(.vertical, 100)
                    .frame(width: 170)
                
                VStack {
                    HStack {
                        Text("Count  the days?")
                            .font(.title)
                            .fontWeight(.bold)
                            .frame(width: geometry.size.width * 0.7, alignment: .leading)
                        
                        Toggle("" ,isOn: $willSetGoal)
                            .onChange(of: willSetGoal, perform: { newValue in
                                if (newValue == false) {
                                    kounterData.goal = -1
                                }
                            })
                        
                    }.padding(.vertical, 5)
                    
                    Text("Goals on \"\(kounterData.name)\" will allow showing progress indicators, set milestones and keep you engajed on keep doing activities related to your counter.")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    if (willSetGoal) {
                        VStack {
                            TextField("Goal", value: $kounterData.goal, format: .number)
                            .font(.system(size: 70).weight(.medium))
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                            .submitLabel(.done)
                            .disableAutocorrection(true)
                            .textFieldStyle(.plain)
                        }
                        .frame(maxHeight: .infinity, alignment: .center)
                    }
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: NewKounterStep4SheetView(kounterData: kounterData),
                        tag: true,
                        selection: $hasHitNextStep,
                        label: { EmptyView() }
                    )
                    .opacity(0)
                    
                    Button(action: { print("next step...") }) {
                        Text("Next").frame(maxWidth: .infinity)
                    }
                    .padding()
                    .foregroundColor(Color.white)
                    .background(.blue)
                    .cornerRadius(8)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .navigationTitle("Date behavior")
            .navigationBarTitleDisplayMode(.inline)
            .onTapGesture {
                self.hideKeyboard()
            }
        }
    }
}

struct NewKounterStep4SheetView_Previews: PreviewProvider {
    static var previews: some View {
        NewKounterStep4SheetView(kounterData: .empty())
            .previewInterfaceOrientation(.portrait)
    }
}
