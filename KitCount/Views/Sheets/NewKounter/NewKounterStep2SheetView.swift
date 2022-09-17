//
//  NewKounterStep2SheetView.swift
//  KitCount
//
//  Created by Marconi Gomes on 16/09/22.
//

import SwiftUI
import Combine

struct NewKounterStep2SheetView: View {
    var kounterName: String
    
    @State
    private var textualKounterGoal: String = "100"
    
    @State
    private var kounterGoal = 0
    
    @State
    private var willSetGoal: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: "flag.checkered")
                .resizable()
                .scaledToFit()
                .padding(100)
                .foregroundColor(Color.blue)
            
            VStack {
                HStack {
                    Text("Use goals?")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Toggle("" ,isOn: $willSetGoal)
                }.padding(.vertical, 5)

                Text("Goals on \"\(kounterName)\" will allow showing progress indicators, set milestones and keep you engajed on keep doing activities related to your counter.")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if (willSetGoal) {
                    if (kounterGoal >= 100) {
                        VStack {
                            TextField("Counter goal", text: $textualKounterGoal)
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                                .submitLabel(.done)
                                .disableAutocorrection(true)
                                .textFieldStyle(.roundedBorder)
                                .padding(.top, 20)
                                .onReceive(Just(textualKounterGoal)) { newValue in
                                    let filtered = newValue.filter { "0123456789".contains($0) }
                                    if filtered != newValue {
                                        self.textualKounterGoal = filtered
                                    }
                                }
                            
                            Text("High goals, huh? Type it in!")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .frame(maxWidth: .infinity, alignment: .center)
                        }.padding(.vertical, 60)
                    }
                    else {
                        Picker("Counter goal", selection: $kounterGoal) {
                            ForEach(0...100, id: \.self) { number in
                                Text("\(number)").tag(number)
                            }
                        }.pickerStyle(.wheel)
                    }
                }
                
                Spacer()
                
                Button(action: { print("next step...") }) {
                    Text("Next").frame(maxWidth: .infinity)
                }
                .padding()
                .foregroundColor(Color.white)
                .background(.blue)
                .cornerRadius(8)
            }
        }
        .padding(.horizontal, 50)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onTapGesture {
            self.hideKeyboard()
        }
    }
    
    var kounterNameIsValid: Bool {
        return !kounterName.isEmpty
    }
    
    func BoolToString(b: Bool?)->String { return b?.description ?? "<None>"}
}

struct NewKounterStep2SheetView_Previews: PreviewProvider {
    static var previews: some View {
        NewKounterStep2SheetView(kounterName: "")
            .previewInterfaceOrientation(.portrait)
    }
}

