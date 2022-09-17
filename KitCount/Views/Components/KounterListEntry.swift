//
//  KounterListEntry.swift
//  KitCount
//
//  Created by Marconi Gomes on 10/09/22.
//

import SwiftUI

struct KounterListEntry: View {
    @State private var showingDeleteConfirmation = false
    var kounter: Kounter
    
    var body: some View {
        VStack(alignment: .leading) {
                Text("\(kounter.name)")
                    .fontWeight(.semibold)

                HStack(alignment: .bottom) {
                    Text("\(kounter.value)")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)

                    Spacer()

                    if (kounter.goal > -1) {
                        VStack(alignment: .trailing) {
                            Text("Goal")
                                .font(.system(size: 14))
                                .foregroundColor(.secondary)
                            Text("/\(kounter.goal)")
                                .font(.system(size: 22))
                                .fontWeight(.bold)
                                .foregroundColor(.secondary)
                                .lineLimit(1)
                                .minimumScaleFactor(0.3)
                        }.padding(.vertical, 10)
                    }
                }
            }
            .padding()
            .listRowSeparator(.hidden).listRowBackground(Color.blue.opacity(0))
            .background(.thinMaterial)
            .cornerRadius(18)
            .shadow(color: .gray.opacity(0.7), radius: 7, x: 0, y: 0)
            .contextMenu {
                Button {
                    showingDeleteConfirmation.toggle()
                } label: {
                    Label("Delete", systemImage: "trash")
                }
            }
            .alert(
                "Delete \"\(kounter.name)\" ?",
                isPresented: $showingDeleteConfirmation,
                actions: {
                    Button("Cancel", role: .cancel) { }
                    Button("Delete", role: .destructive) { deleteKounter() }},
                message: {
                    Text("This action cannot be undone.")
                }
            )
            
    }
    
    func deleteKounter() {
        PersistenceController.shared.persistentContainer.viewContext.delete(kounter)
    }
}

struct KounterListEntry_Previews: PreviewProvider {
    static var previews: some View {
        KounterListEntry(kounter: Kounter.getMocked())
    }
}
