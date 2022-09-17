//
//  KounterDetailsView.swift
//  KitCount
//
//  Created by Marconi Gomes on 06/09/22.
//

import SwiftUI

struct KounterDetailsView: View {
    var kounter: Kounter
    
    var body: some View {
                VStack {
                    HStack(alignment: .top) {
                        VStack {
                            Text("\(kounter.name)")
                                .multilineTextAlignment(.center)
                                .font(.title)
                            
                            Text("\(kounter.value)")
                                .font(.system(size: 120))
                                .bold()
                                .padding(.vertical, -5)
                            
                            if (kounter.goal > -1) {
                                Text("The goal is \(kounter.goal)")
                                    .padding(.vertical, 5)
                            } else {
                                Button(action: {}){
                                    Text("Add a goal")
                                        .foregroundColor(.secondary)
                                        .padding(.vertical, 5)
                                }
                            }
                            
                            if (kounter.hasDesc) {
                                //TODO: Change this to a instant editable property (textField + click)
                                Text("\(kounter.desc!)")
                                    .fontWeight(.light)
                                    .foregroundColor(.secondary)
                                    .italic()
                                    .padding(.vertical, 5)
                            } else {
                                Button(action: {}){
                                    Text("Add a description")
                                        .italic()
                                        .foregroundColor(.secondary)
                                        .padding(.vertical, 5)
                                }
                            }
                            
                        }
                        .frame(maxWidth: .infinity)
                    }
                    
                    VStack {
//                        Text("howdy")
                        
                        Spacer()
                    }
                    .background(.blue)
            }
    }
}

struct KounterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        KounterDetailsView(kounter: Kounter.getMocked())
    }
}
