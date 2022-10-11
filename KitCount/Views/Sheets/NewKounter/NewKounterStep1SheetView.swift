import SwiftUI

struct NewKounterStep1SheetView: View {
    @State
    private var kounterData = NewKounterData.empty()
    
    @State
    private var hasHitNextStep: Bool? = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "character.cursor.ibeam")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color.blue)
                    .padding(.vertical, 100)
                    .frame(width: 150)
                
                VStack {
                    Text("Name your counter")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 5)
                    
                    Text("This will be the displayed name for your counter on the list, details and home screen widgets.")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    VStack {
                        TextField(
                            "E.g. Days I went to the gym",
                            text: $kounterData.name
                        )
                        .submitLabel(.done)
                        .textFieldStyle(.roundedBorder)
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: NewKounterStep2SheetView(kounterData: kounterData),
                        tag: true,
                        selection: $hasHitNextStep,
                        label: { EmptyView() }
                    )
                    .opacity(0)
                    
                    Button(action: { hasHitNextStep = true }) { Text("Next").frame(maxWidth: .infinity) }
                        .disabled(!kounterNameIsValid)
                        .padding()
                        .foregroundColor(Color.white)
                        .background(buttonBackgroundColor)
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .navigationViewStyle(.stack)
            .navigationTitle("Name")
            .navigationBarTitleDisplayMode(.inline)
            .onTapGesture {
                self.hideKeyboard()
            }
        }
    }
    
    var kounterNameIsValid: Bool {
        return !kounterData.name.isEmpty
    }
    
    var buttonBackgroundColor: Color {
        return kounterNameIsValid
            ? .blue
            : .gray
    }
}

struct NewKounterStep1SheetView_Previews: PreviewProvider {
    static var previews: some View {
        NewKounterStep1SheetView()
            .previewInterfaceOrientation(.portrait)
    }
}
