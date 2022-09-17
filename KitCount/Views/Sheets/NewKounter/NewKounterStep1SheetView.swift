//
//  KounterNewSheetView.swift
//  KitCount
//
//  Created by Marconi Gomes on 11/09/22.
//

import SwiftUI

struct NewKounterStep1SheetView: View {
    @State
    private var kounterName: String = ""
    
    @State
    private var hasHitNextStep: Bool? = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "character.cursor.ibeam")
                    .resizable()
                    .scaledToFit()
                    .padding(100)
                    .foregroundColor(Color.blue)
                
                VStack {
                    Text("Name your counter")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextField(
                        "E.g. Days I went to the gym",
                        text: $kounterName
                    )
                    .submitLabel(.done)
                    .textFieldStyle(.roundedBorder)
                    
                    Text("This will be the displayed name for your counter on the list, details and home screen widgets.")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    
                    NavigationLink(
                        destination: NewKounterStep2SheetView(kounterName: kounterName),
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
            .padding(.horizontal, 50)
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onTapGesture {
            self.hideKeyboard()
        }
    }
    
    var kounterNameIsValid: Bool {
        return !kounterName.isEmpty
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
