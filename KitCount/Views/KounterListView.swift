//
//  KounterListView.swift
//  KitCount
//
//  Created by Marconi Gomes on 02/09/22.
//

import SwiftUI
import CoreData

struct KounterListView: View {
    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(
                keyPath: \Kounter.value,
                ascending: false
            )
        ],
        animation: .default)
    private var kounters: FetchedResults<Kounter>
    
    @State
    private var showingNewKounterSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(kounters, id: \.objectID) { kounter in
                    ZStack {
                        KounterListEntry(kounter: kounter)
                        
                        NavigationLink(destination: KounterDetailsView(kounter: kounter), label: { EmptyView() })
                            .opacity(0)
                    }
                    .listRowSeparator(.hidden).listRowBackground(Color.blue.opacity(0))
                    .padding(.vertical, 5)
                    
                }
                .navigationTitle("KitCount")
                .navigationViewStyle(.stack)
            }
            .listRowBackground(Color.blue.opacity(0))
            .listStyle(PlainListStyle())
            .toolbar {
                Button { showingNewKounterSheet.toggle() } label: { Image(systemName: "plus") }
            }
            .sheet(isPresented: $showingNewKounterSheet, onDismiss: {}) {
                NewKounterStep1SheetView()
            }
        }
    }
    
    func didDismiss() {
        showingNewKounterSheet.toggle()
    }
}

struct YourButtonStyle: ButtonStyle {

  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
      .padding()
      .foregroundColor(.white)
      .background(configuration.isPressed ? Color.green : Color.blue)
      .cornerRadius(8.0)
  }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.persistentContainer.viewContext
        KounterListView()
            .environment(\.managedObjectContext, context)
    }
}
